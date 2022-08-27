<?php

$languages = ['de', 'fr', 'hr'];

$multiLanguagePaths = [
    '_features' => [
        'keep_front_matter' => ['title', 'documentation', 'canonical'],
        'skip' => [],
    ],
    '_pages' => [
        'keep_front_matter' => ['title', 'description', 'lang', 'canonical', 'header', 'permalink', 'redirect_from'],
        'skip' => ['v1.md'],
    ],
    '_store' => [
        'keep_front_matter' => ['title', 'description', 'lang', 'canonical', 'header', 'permalink', 'redirect_from', 'intro'],
        'skip' => ['v1.md'],
        'permalink' => '/:language/store/:basename',
    ],
//    '_documentation' => [
//        'keep_front_matter' => ['title', 'description', 'redirect_from', 'canonical'],
//        'skip' => [],
//    ],
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

            if (!file_exists($langTargetFile)) {
                $newContentFile = $contentTarget . '/' . $baseFileName;

                if (!file_exists($newContentFile)) {
                    $content = file_get_contents($file);
                    $pos = strpos($content, '---', strpos($content, '---') + 3);

                    $pureContent = substr($content, $pos + 3);

                    $include = $includePath . '/' . basename($file);

                    $newContent = substr($content, 0, $pos);
                    if (strpos($newContent, 'lang:') === false) {
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
                if ($createPermalink && strpos($translatedContent, 'permalink:') === false) {
                    $permalink = str_replace(':language', $language, $settings['permalink']);
                    $permalink = str_replace(':basename', basename($langTargetFile), $permalink);
                    $permalink = str_replace('.md', '.html', $permalink);
                    $replaceMe .= PHP_EOL . 'permalink: ' . $permalink;
                }
                $translatedContent = str_replace('lang: en', $replaceMe, $translatedContent);
                file_put_contents($langTargetFile, $translatedContent);
            }
        }
    }
}
