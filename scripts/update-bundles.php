<?php

include_once (__DIR__ . '/../vendor/autoload.php');

use Symfony\Component\Yaml\Yaml;

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://license.kimai.org/api/product/");
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

if(curl_exec($ch) === FALSE) {
    echo "Error: " . curl_error($ch);
    curl_close($ch);
    return;
}

$json = curl_exec($ch);
curl_close($ch);
$bundles = json_decode($json, true);

$releasesDir = realpath(__DIR__ . '/../_data/store/releases/');
$changelogDir = realpath(__DIR__ . '/../_includes/store/changelog/');

foreach ($bundles as $bundle) {

    touch($releasesDir . '/' . $bundle['bundle'] . '.yaml');

    $changelog = '';
    $versions = [];

    foreach ($bundle['releases'] as $release) {
        $versions[] = [$release['version'], $release['kimai']];

        $changelog .= '## Version ' . $release['version']
            . PHP_EOL
            . PHP_EOL
            . 'Compatibility: requires minimum Kimai ' . $release['kimai']
            . PHP_EOL
            . PHP_EOL
            . $release['changelog']
            . PHP_EOL
            . PHP_EOL
        ;
    }

    file_put_contents($changelogDir . '/' . $bundle['bundle'] . '.md', $changelog);
    file_put_contents($releasesDir . '/' . $bundle['bundle'] . '.yaml', Yaml::dump(['versions' => $versions]));
}
