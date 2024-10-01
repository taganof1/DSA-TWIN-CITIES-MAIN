<?php

// Convert cached data to same type as API response
function transformCachedData($weatherCacheData)
{

    return (object) [
        'main' => (object) [
            'temp' => $weatherCacheData['main']['temp'],
        ],
        'weather' => [
            (object) [
                'icon' => $weatherCacheData['weather'][0]['icon'],
                'description' => $weatherCacheData['weather'][0]['description'],
            ]
        ],
    ];
}

function displayWeatherSidebar($cityData)
{
    $city = urlencode($cityData['Name']) . "," . $cityData['Country'];

    // Read existing data from the file
    $existingWeatherCacheData = [];
    if (file_exists(WEATHER_CACHE_FILE)) {
        $existingWeatherCacheData = json_decode(file_get_contents(WEATHER_CACHE_FILE), true);
    }

    if (
        isset($existingWeatherCacheData[$city]) &&
        (time() - $existingWeatherCacheData[$city]['timestamp'] < WEATHER_CACHE_DURATION) // 1800 seconds = 30 minutes
    ) {
        // Use cached data
        $weatherCacheData = $existingWeatherCacheData[$city]['data'];

        // Transform cached data into the same format as the API response
        $weatherData = transformCachedData($weatherCacheData);

    } else {
        // Fetch data from the API
        $weatherUrl = WEATHER_API_URL . "q=" . $city . "&appid=" . WEATHER_API_KEY;
        $weatherResponse = file_get_contents($weatherUrl);
        $weatherData = json_decode($weatherResponse);
    


        // Check if data is valid before saving to the cache
        if (!$weatherData) {
            // Handle the case where fetching data from the API failed
            return '<div class="alert alert-danger" role="alert">Error occurred fetching weather data</div>';
        }

        // Save the updated data to the file
        $existingWeatherCacheData[$city] = [
            'timestamp' => time(),
            'data' => (array) $weatherData, // Save data as an associative array
        ];
        file_put_contents(WEATHER_CACHE_FILE, json_encode($existingWeatherCacheData, JSON_PRETTY_PRINT));
    }

    // Display weather information
    if (isset($weatherData->main->temp, $weatherData->weather[0]->icon, $weatherData->weather[0]->description)) {
        $temperature = number_format($weatherData->main->temp - 273.15, 1);
        $weatherIconCode = $weatherData->weather[0]->icon;
        $weatherDescription = ucfirst($weatherData->weather[0]->description);
        $weatherIcon = '../styles/weatherIcons/' . getWeatherIcon($weatherIconCode);
    }
       // Output weather information
    if ($weatherData) {
        echo "<div class='row justify-content-center mt-5 mb-3'>";
        echo "<div class='col-8'>";
        echo "<img src='{$weatherIcon}' alt='{$weatherDescription}' class='img-fluid'>";
        echo "</div>";
        echo "</div>";
        echo "<div class='row'>";
        echo "<div class='col-12'>";
        echo "<h2 class='display-6 mb-1'>{$temperature} °C</h2>";
        echo "</div>";
        echo "</div>";
        echo "<div class='row'>";
        echo "<div class='col-12'>";
        echo "<h4>{$weatherDescription}</h4>";
        echo "</div>";
        echo "</div>";
    } else {
        echo "<div class='alert alert-danger' role='alert'>";
        echo "Error fetching weather data for {$city}.";
        echo "</div>";
    }
}

displayWeatherSidebar($cityData);
?>