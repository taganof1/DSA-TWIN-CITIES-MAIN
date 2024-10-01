<?php
include '../components/dbFuncs.php';

$allPoiData = fetchAllPoi();
$data = getallcities();

// Create a new DOMDocument
$dom = new DOMDocument('1.0', 'UTF-8');
$dom->formatOutput = true;

// Create the root <rss> element
$rss = $dom->createElement('rss');
$rss->setAttribute('version', '2.0');
$dom->appendChild($rss);

// Create the <channel> element
$channel = $dom->createElement('channel');
$rss->appendChild($channel);

// Loop through each city data and add it to the RSS feed
foreach ($data as $city) {
    $item = $dom->createElement('item');

    $item->appendChild($dom->createElement('title', $city['Name'] . ', ' . $city['Country']));
    $item->appendChild($dom->createElement('Language', $city['Language']));
    $item->appendChild($dom->createElement('Population', $city['Population']));
    $item->appendChild($dom->createElement('latitude', $city['Latitude']));
    $item->appendChild($dom->createElement('longitude', $city['Longitude']));
    $item->appendChild($dom->createElement('timezone', $city['Timezone']));
    $item->appendChild($dom->createElement('currency', $city['Currency']));
    $item->appendChild($dom->createElement('currency_code', $city['CurrencyCode']));

    // Fetch POI data for the current city
    $cityPoiData = array_filter($allPoiData, function ($poi) use ($city) {
        return $poi['CityID'] == $city['CityID'];
    });

    // Loop through each POI and add it to the current city's item
    foreach ($cityPoiData as $poi) {
        $poiElement = $dom->createElement('poi');
        $poiElement->appendChild($dom->createElement('poi_name', $poi['Name']));
        $poiElement->appendChild($dom->createElement('description', $poi['History']));
        $poiElement->appendChild($dom->createElement('wikilink', $poi['Wikilink']));
        $poiElement->appendChild($dom->createElement('latitude', $poi['Latitude']));
        $poiElement->appendChild($dom->createElement('longitude', $poi['Longitude']));
        

        $item->appendChild($poiElement);
    }

    $channel->appendChild($item);
}

// Output the XML content with appropriate headers
header('Content-Type: application/rss+xml');
echo $dom->saveXML();
?>