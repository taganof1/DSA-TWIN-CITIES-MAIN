<?php
function degreesToDirection($degrees)
{
    // Ensure the degree value is within 0 to 360 range
    $degrees = fmod(($degrees + 360), 360);

    // Define direction sectors
    $directions = [
        'North',
        'North East',
        'East',
        'South East',
        'South',
        'South West',
        'West',
        'North West',
        'North'
    ];

    // Calculate index based on degree
    $index = intval(($degrees + 22.5) / 45);

    // Return the corresponding direction
    return $directions[$index];
}
function getWind($cityData)
{
    $city = urlencode($cityData['Name']) . "," . $cityData['Country'];
    // Check if the cache file exists and is not expired
    if (file_exists(WEATHER_CACHE_FILE) && time() - filemtime(WEATHER_CACHE_FILE) < WEATHER_CACHE_DURATION) {
        // Cache is valid, retrieve data from the cache file
        $weatherCacheResponse = json_decode(file_get_contents(WEATHER_CACHE_FILE), true); // Decode as an associative array
        // Check if the selected city data is present in the cache
        $selectedCityData = $weatherCacheResponse[$city] ?? null;

        if ($selectedCityData !== null) {
            // Selected city data is present in the cache
            $data = $selectedCityData;
        } else {
            // Selected city data is not present in the cache, return null
            return null;
        }
    }
    return $data;
}
// get sunrise and sunset times for the selected city
$weatherData = getWind($cityData);

// display data
if (!$weatherData) {
    echo '<div class="alert alert-danger" role="alert">';
    echo 'Error retrieving wind data';
    echo '</div>';
} else {
    $windSpeed = $weatherData['data']['wind']['speed'];
    $windDirection = degreesToDirection($weatherData['data']['wind']['deg']);
}
?>

<div class="card w-100">
    <div class="card-body">
        <h5 class="text-muted">Wind</h5>

        <h2>
            <?php echo round($windSpeed, 1); ?> <small>km/h</small>
        </h2>
        <h5>
            <?php echo $windDirection; ?>
        </h5>

    </div>
</div>