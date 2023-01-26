<?php

// once development is over, switch back to the list of all currently active languages
// $languages = ['de', 'fr', 'hr'];

// list of all languages, with at least some translations
// $languages = ['de', 'fr', 'hr', 'he', 'fa', 'ar', 'ko', 'nb_NO', 'pt_BR', 'ru', 'uk', 'vi', 'zh_Hans',];

// list of languages currently working on
$languages = ['pt_BR', 'he'];

$multiLanguagePaths = [
    '_pages' => [
        'skip' => ['v1.md'],
        'permalink' => '/:language/:original',
        'remove' => ['redirect_from'],
        'overwrite' => false,
    ],
    '_store' => [
        'skip' => ['v1.md'],
        'permalink' => '/:language/store/:basename',
        'remove' => ['redirect_from'],
        'overwrite' => true,
    ],
];

foreach ($multiLanguagePaths as $path => $settings)
{
    $basePath = __DIR__ . '/' . $path;
    $files = glob($basePath . '/*.{md,html}', GLOB_BRACE);
    $includePath = str_replace('_', '', $path);
    $contentTarget = __DIR__ . '/_includes/' . $includePath;
    $createPermalink = array_key_exists('permalink', $settings);

    foreach ($files as $file) {
        $baseFileName = basename($file);
        foreach ($languages as $language) {
            $langPath = $basePath . '/' . $language;
            $langTargetFile = $langPath . '/' . $baseFileName;

            if (in_array($baseFileName, $settings['skip'])) {
                continue;
            }

            if ($settings['overwrite'] || !file_exists($langTargetFile)) {
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

                if (!file_exists($langPath)) {
                    mkdir($langPath, 0777, true);
                }

                copy($file, $langTargetFile);

                $translatedContent = file_get_contents($langTargetFile);
                $replaceMe = 'lang: ' . $language;

                $permalink = str_replace(':language', $language, $settings['permalink']);
                $permalink = str_replace(':basename', basename($langTargetFile), $permalink);
                $permalink = str_replace('.md', '.html', $permalink);

                if (!str_contains($translatedContent, 'permalink:')) {
                    $replaceMe .= PHP_EOL . 'permalink: ' . $permalink;
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
                    $translatedContent = str_replace('permalink: ' . $originalPermalink, 'permalink: ' . $permalink, $translatedContent);
                }

                $translatedContent = str_replace('lang: en', $replaceMe, $translatedContent);

                foreach ($settings['remove'] as $removal) {
                    $translatedContent = preg_replace('/'.$removal.': (.*)\\n/', '', $translatedContent);
                }

                file_put_contents($langTargetFile, $translatedContent);
            }
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
