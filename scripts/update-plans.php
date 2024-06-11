<?php

include_once (__DIR__ . '/../vendor/autoload.php');

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://www.kimai.cloud/cloud_api/plans");
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

if(curl_exec($ch) === FALSE) {
    echo "Error: " . curl_error($ch);
    curl_close($ch);
    return;
}

$json = curl_exec($ch);
curl_close($ch);
$plans = json_decode($json, true);

$dataDir = realpath(__DIR__ . '/../_data/');
$plansDir = realpath($dataDir . '/plans/');
$features = [];

foreach ($plans as $plan) {
    if (isset($plan['teaser']['annual_payment'])) {
        unset($plan['teaser']['annual_payment']);
    }
    if (isset($plan['teaser']['all_from_plan'])) {
        unset($plan['teaser']['all_from_plan']);
    }
    if (isset($plan['teaser'][''])) {
        unset($plan['teaser']['']);
    }
    if (isset($plan['teaser']['expense_tracking'])) {
//        $plan['teaser']['expense'] = $plan['teaser']['expense_tracking'];
//        unset($plan['teaser']['expense_tracking']);
    }

    $features = array_merge($features, array_keys($plan['teaser']));
    $features = array_merge($features, array_keys($plan['features']));

    if (isset($plan['teaser']['ip_whitelist'])) {
        unset($plan['teaser']['ip_whitelist']);
    }

    file_put_contents($plansDir . '/' . $plan['id'] . '.yml', \Symfony\Component\Yaml\Yaml::dump($plan));
}

$features = array_unique($features);
//unset($features['expense']);

$features = [
    'features' => array_values($features),
];

file_put_contents($dataDir . '/cloud-features.yml', \Symfony\Component\Yaml\Yaml::dump($features));
