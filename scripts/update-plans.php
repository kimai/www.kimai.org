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

$dataDir = realpath(__DIR__ . '/../_data/plans/');

foreach ($plans as $plan) {
    file_put_contents($dataDir . '/' . $plan['id'] . '.yml', \Symfony\Component\Yaml\Yaml::dump($plan));
}
