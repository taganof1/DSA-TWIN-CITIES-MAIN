<?php
function displayForecast($cityData)
{

    $city = urlencode($cityData['Name']) . "," . $cityData['Country'];
    $lat = urlencode($cityData['Latitude']);
    $lon = urlencode($cityData['Longitude']);

    // Get weather forecast data from the cache if it exists
    $existingWeatherCacheData = [];
    if (file_exists(WEATHER_FORECAST_CACHE_FILE)) {
        $existingWeatherCacheData = json_decode(file_get_contents(WEATHER_FORECAST_CACHE_FILE), true);
    }

    //if the cache is less younger than WEATHER_CACHE_DURATION (see '../config.php)
    if (
        isset($existingWeatherCacheData[$city]) &&
        (time() - $existingWeatherCacheData[$city]['timestamp'] < WEATHER_CACHE_DURATION)
    ) {
        // use data from cache
        $weatherCacheData = $existingWeatherCacheData[$city]['data'];
        $weatherData = $weatherCacheData;
    } else {
        // else get from the OWM API
        $weatherUrl = WEATHER_API_URL_FORECAST . "lat=" . $lat . "&lon=" . $lon . "&cnt=5&appid=" . WEATHER_API_KEY;
        $weatherResponse = file_get_contents($weatherUrl);
        $weatherData = json_decode($weatherResponse, true);
        // if there isnt any data in $weatherData throw an error 
        if (!$weatherData) {
            return '<div class="alert alert-danger" role="alert">Error occurred fetching forecast data</div>';
        }
        //save data to cache
        $existingWeatherCacheData[$city] = [
            'timestamp' => time(),
            'data' => (array) $weatherData,
        ];
        file_put_contents(WEATHER_FORECAST_CACHE_FILE, json_encode($existingWeatherCacheData, JSON_PRETTY_PRINT));
    }
    //get information
    return ($weatherData['list']);
}
?>

<div class="card w-100">
    <div class="card-body">
        <h5 class="text-muted">Weather forecast</h5>

        <div class="row">
            <div class="col-md-3">
                <p class="mb-2">
                    <?php echo date("l", displayForecast($cityData)[1]['dt']); ?>
                </p>
                <img class="w-25"
                    src=<?php echo '../styles/weatherIcons/' . getWeatherIcon(displayForecast($cityData)[1]['weather'][0]['icon']); ?>
                    alt='' class='img-fluid'>
                <h4 class="mt-3 mb-0">
                    <?php echo number_format(displayForecast($cityData)[1]['temp']['day'] - 273.15, 1) . "°C" ?>
                </h4>
                <p>
                    <?php echo ucfirst(displayForecast($cityData)[1]['weather'][0]['description']); ?>
                </p>
            </div>

            <div class="col-md-3">
                <p class="mb-2">
                    <?php echo date("l", displayForecast($cityData)[2]['dt']); ?>
                </p>
                <img class="w-25"
                    src=<?php echo '../styles/weatherIcons/' . getWeatherIcon(displayForecast($cityData)[2]['weather'][0]['icon']); ?>
                    alt='' class='img-fluid'>
                <h4 class="mt-3 mb-0">
                    <?php echo number_format(displayForecast($cityData)[2]['temp']['day'] - 273.15, 1) . "°C" ?>
                </h4>
                <p>
                    <?php echo ucfirst(displayForecast($cityData)[2]['weather'][0]['description']); ?>
                </p>
            </div>

            <div class="col-md-3">
                <p class="mb-2">
                    <?php echo date("l", displayForecast($cityData)[3]['dt']); ?>
                </p>
                <img class="w-25"
                    src=<?php echo '../styles/weatherIcons/' . getWeatherIcon(displayForecast($cityData)[3]['weather'][0]['icon']); ?>
                    alt='' class='img-fluid'>
                <h4 class="mt-3 mb-0">
                    <?php echo number_format(displayForecast($cityData)[3]['temp']['day'] - 273.15, 1) . "°C" ?>
                </h4>
                <p>
                    <?php echo ucfirst(displayForecast($cityData)[3]['weather'][0]['description']); ?>
                </p>
            </div>

            <div class="col-md-3">
                <p class="mb-2">
                    <?php echo date("l", displayForecast($cityData)[4]['dt']); ?>
                </p>
                <img class="w-25"
                    src=<?php echo '../styles/weatherIcons/' . getWeatherIcon(displayForecast($cityData)[4]['weather'][0]['icon']); ?>
                    alt='' class='img-fluid'>
                <h4 class="mt-3 mb-0">
                    <?php echo number_format(displayForecast($cityData)[4]['temp']['day'] - 273.15, 1) . "°C" ?>
                </h4>
                <p>
                    <?php echo ucfirst(displayForecast($cityData)[4]['weather'][0]['description']); ?>
                </p>
            </div>

        </div>
    </div>
</div>