<?php
function getSunriseSunset($cityData)
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
$weatherData = getSunriseSunset($cityData);


// display times
if (!$weatherData) { 
    ?>
<div class="alert alert-danger" role="alert">
        Error retrieving sunrise and sunset data
</div>
<?php
} else {
    $sunriseTime = date("h:i", $weatherData['data']['sys']['sunrise']);
    $sunriseAmPm = date("a", $weatherData['data']['sys']['sunrise']);

    $sunsetTime = date("h:i", $weatherData['data']['sys']['sunset']);
    $sunsetAmPm = date("a", $weatherData['data']['sys']['sunset']);

}
?>
<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-md-6">
                <h5 class="text-muted">Sunrise</h5>
                <h2 class="text-dark">
                    <?php echo $sunriseTime; ?>
                </h2>
                <h5>
                    <?php echo strtoupper($sunriseAmPm); ?>
                </h5>
            </div>
            <div class="col-md-6">
                <h5 class="text-muted">Sunset</h5>
                <h2 class="text-dark">
                    <?php echo $sunsetTime; ?>
                </h2>
                <h5>
                    <?php echo strtoupper($sunsetAmPm); ?>
                </h5>
            </div>
        </div>
    </div>
</div>