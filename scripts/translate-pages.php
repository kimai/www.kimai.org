<?php

$realpath = realpath(__DIR__ . '/..');
chdir($realpath);

// once development is over, switch back to the list of all currently active languages
$languages = ['cs', 'de', 'es', 'fr', 'he', 'hr', 'it', 'nl', 'pl', 'pt', 'pt_BR', 'ru', 'sk', 'sv', 'uk', 'zh_Hans', 'zh_Hant'];

// currently working on:
//$languages = ['zh_Hant'];

$multiLanguagePaths = [
    '_pages' => [
        'skip' => ['documentation.md', 'industry.html', 'time-tracking-terms.html', 'changelogs.html'],
        'permalink' => '/:language/:original',
        'remove' => ['redirect_from'],
        'overwrite' => true,
        'exclude_existing' => ['de/privacy-policy.md', 'de/site-notice.md', 'de/terms-cloud.md', 'de/terms-gdpr.md', 'de/terms-plugins.md', 'de/trademark.md'],
        'with_content' => true,
        'skip_content' => ['index.html', 'blog.html', 'store.html'],
    ],
    /*
    '_error' => [
        'skip' => [],
        'remove' => [],
        'overwrite' => true,
        'exclude_existing' => [],
        'with_content' => false,
        'skip_content' => [],
    ],
    */
    '_store' => [
        'skip' => ['v1.md'],
        'permalink' => '/:language/store/:basename',
        'remove' => ['redirect_from'],
        'overwrite' => false, // do not change this flag, it will cause too many changes in existing pages
        'exclude_existing' => [],
        'with_content' => true,
        'skip_content' => [],
    ],
];

foreach ($multiLanguagePaths as $path => $settings)
{
    $basePath = $realpath . '/collections/' . $path;
    $files = glob($basePath . '/*.{md,html}', GLOB_BRACE);
    $includePath = str_replace('_', '', $path);
    $contentTarget = $realpath . '/_includes/' . $includePath;
    $createPermalink = array_key_exists('permalink', $settings);

    foreach ($files as $file) {
        $baseFileName = basename($file);
        foreach ($languages as $language) {
            $langPath = $basePath . '/' . $language;
            $langTargetFile = $langPath . '/' . $baseFileName;
            $relTarget = $language . '/' . $baseFileName;

            if (in_array($baseFileName, $settings['skip'])) {
                continue;
            }

            if (file_exists($langTargetFile)) {
                if ($settings['overwrite'] === false) {
                    continue;
                }

                if (in_array($relTarget, $settings['exclude_existing'])) {
                    continue;
                }
            }

            if ($settings['with_content'] && !in_array($baseFileName, $settings['skip_content'], true)) {
                $newContentFile = $contentTarget . '/' . $baseFileName;

                if (!file_exists($newContentFile)) {
                    $content = file_get_contents($file);
                    $pos = strpos($content, '---', strpos($content, '---') + 3);

                    $pureContent = substr($content, $pos + 3);

                    $include = $includePath . '/' . basename($file);

                    $newContent = substr($content, 0, $pos);
                    if (!str_contains($newContent, 'lang:')) {
                        $newContent .= 'lang: en' . PHP_EOL;
                    }
                    $newContent .= '---' . PHP_EOL . PHP_EOL . '{% include ' . $include . ' %}';

                    file_put_contents($file, $newContent);
                    file_put_contents($newContentFile, trim($pureContent) . PHP_EOL);
                }
            }

            if (!file_exists($langPath)) {
                mkdir($langPath, 0777, true);
            }

            copy($file, $langTargetFile);

            $translatedContent = file_get_contents($langTargetFile);
            $replaceMe = 'lang: ' . $language;

            if ($createPermalink) {
                $permalink = str_replace(':language', $language, $settings['permalink']);
                $permalink = str_replace(':basename', basename($langTargetFile), $permalink);
                $permalink = str_replace('.md', '.html', $permalink);

                if (!str_contains($translatedContent, 'permalink:')) {
                    $replaceMe .= PHP_EOL . 'permalink: "' . $permalink . '"';
                } else {
                    $result = preg_match('/permalink: (.*)\\n/', $translatedContent, $matches);
                    if (count($matches) !== 2) {
                        throw new Exception('Invalid permalink in: ' . $file);
                    }
                    $originalPermalink = $matches[1];
                    $permalink = str_replace(':original', $originalPermalink, $permalink);
                    if (!str_starts_with($permalink, '/' . $language . '/')) {
                        $permalink = str_replace('/en/', '/' . $language . '/', $permalink);
                    } else {
                        $permalink = str_replace('/en/', '/', $permalink);
                    }
                    $permalink = str_replace('//', '/', $permalink);
                    $translatedContent = str_replace('permalink: ' . $originalPermalink, 'permalink: ' . $permalink,
                        $translatedContent);
                }
            }

            if (str_contains($translatedContent, 'canonical: /en/')) {
                $translatedContent = str_replace('sitemap: true', 'sitemap: false', $translatedContent);
            }

            $translatedContent = str_replace('lang: en', $replaceMe, $translatedContent);

            foreach ($settings['remove'] as $removal) {
                $translatedContent = preg_replace('/'.$removal.': (.*)\\n/', '', $translatedContent);
            }

            file_put_contents($langTargetFile, $translatedContent);
        }
    }
}

/*
$basePath = realpath(__DIR__ . '/_store/');

$english = [];
foreach (glob($basePath . '/*.md', GLOB_BRACE) as $file) {
    $english = array_merge($english, getForFile($file));
}

writeFile(__DIR__ . '/en.yaml', $english);

foreach (['de', 'fr', 'hr'] as $language) {
    $translated = [];
    foreach (glob($basePath . '/' . $language . '/*.md', GLOB_BRACE) as $file) {
        $translated = array_merge($translated, getForFile($file));
    }

    $storage = [];
    foreach ($translated as $slug => $values) {
        if (!array_key_exists($slug, $english)) {
            throw new Exception('Missing english slug: ' . $slug);
        }
        foreach ($values as $k => $v) {
            if ($english[$slug][$k] !== $v) {
                $storage[$slug][$k] = $v;
            }
        }
    }
    writeFile(__DIR__ . '/' . $language . '.yaml', $storage);
}
*/
function getForFile($file)
{
    $slug = str_replace('.md', '', basename($file));
    $content = file_get_contents($file);
    preg_match('/slug: (.*)\\n/', $content, $matches);
    if (count($matches) === 2) {
        $slug = $matches[1];
    }
    $extracted[$slug] = [];

    preg_match('/title: (.*)\\n/', $content, $matches);
    if (count($matches) === 2) {
        $extracted[$slug]['title'] = $matches[1];
    }

    preg_match('/intro: (.*)\\n/', $content, $matches);
    if (count($matches) === 2) {
        $extracted[$slug]['intro'] = $matches[1];
    }
    preg_match('/featured: (.*)\\n/', $content, $matches);
    if (count($matches) === 2) {
        $extracted[$slug]['featured'] = $matches[1];
    }
    return $extracted;
}


function writeFile($file, $translation)
{
    $content = '';
    foreach ($translation as $slug => $values) {
        $content .= '    ' . $slug . ':' . PHP_EOL;
        foreach ($values as $k => $v) {
            if (!str_starts_with($v, '"')) {
                $v = '"' . $v . '"';
            }
            $content .= '        ' . $k . ': ' . $v . PHP_EOL;
        }
    }
    file_put_contents($file, $content);

}
