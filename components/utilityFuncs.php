<?php

// Takes base and twin GET parameters
function getCurrentCity($GET)
{
    $base = $GET['base'];

    if (isset($GET['twin'])) {
        $twin = $GET['twin'];
    }

    return isset($twin) ? $twin : $base;
}
// Get Weather Icons
function getWeatherIcon($iconCode)
{
    // Map icon codes to corresponding icons
    switch (mb_substr($iconCode, 0, 2)) {
        case '01':
            return "sun.png";
        case '02':
            return "cloudy.png";
        case '03':
            return "cloud.png";
        case '04':
            return "cloud.png";
        case '09':
            return "rain.png";
        case '10':
            return "rain.png";
        case '11':
            return "thunderstorm.png";
        case '13':
            return "snowy.png";
        case '50':
            return "haze.png";
        default:
            return "sun.png";
    }
}
?>