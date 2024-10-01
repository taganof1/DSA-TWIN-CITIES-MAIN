<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>City view | Twin Cities</title>

    <!-- Link to Bootstrap CSS -->
    <link rel="stylesheet" href="../styles/bootstrap/bootstrap.min.css">

    <!-- Custom CSS file -->
    <link rel="stylesheet" href="../styles/custom.css">

    <!-- Leaflet map library -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
        integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="">
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>

    <!-- Bootstrap JS -->
    <script src="../styles/bootstrap/bootstrap.min.js"></script>
</head>

<body>

    <?php
    include '../components/dbFuncs.php';
    include '../components/utilityFuncs.php';

    // Get data for the current city
    $cityData = fetchCityData(getCurrentCity($_GET));
    // Get data for the base city
    $baseData = fetchCityData($_GET['base']);
    // Get POI for the current city
    $poiData = fetchPoiData(getCurrentCity($_GET));

    ?>

    <div class="sidebar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 d-flex flex-column p-4" style="height: 100vh;">
                    <h3 class="mb-4">
                        <?php echo $baseData['Name'] ?>
                    </h3>

                    <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="GET" id="twinForm">

                        <?php
                        // This block renders the twin select form
                        
                        echo '<label for="twin">Select city</label>';

                        // Get all the twin cities from the database
                        $base = $_GET['base'];
                        $cities = getTwinCities($base);

                        echo '<select class="form-select mb-3" name="twin" id="twin">';

                        if (count($cities) > 0) {

                            // Add the base city to form
                            $base = fetchCityData($_GET['base']);
                            $baseSelected = ($base['CityID'] == $cityData['CityID']) ? 'selected' : '';
                            echo "<option value='' disabled>Base</option>";
                            echo "<option value='{$base['CityID']}' $baseSelected>{$base['Name']}</option>";

                            // Add each twin city
                            echo "<option value='' disabled>Twins</option>";
                            foreach ($cities as $city) {
                                $selected = (isset($_GET['twin']) && $_GET['twin'] == $city['TwinCityID']) ? 'selected' : '';
                                echo "<option value='{$city['TwinCityID']}' $selected>{$city['TwinCityName']}</option>";
                            }
                        } else {
                            echo "<option value='' disabled>No cities found</option>";
                        }
                        echo '</select>';
                        ?>

                        <button class="btn btn-primary w-100 mb-2" type="submit" id="submitButton">
                            Submit
                        </button>

                    </form>

                    <a class="btn btn-outline-secondary w-100" href="index.php">
                        Change base city
                    </a>


                    <!-- Weather -->
                    <div class="row mb-5">
                        <div class="col-12">
                            <?php include '../components/weather.php'; ?>
                        </div>
                    </div>

                    <div class="mt-auto">
                        <a class="btn btn-outline-secondary w-100 mb-2 mt-auto" href="./cityrss.php">
                            <i class="bi bi-rss"></i> View RSS
                        </a>
                        <button type="button" class="btn btn-outline-secondary w-100" data-bs-toggle="modal"
                            data-bs-target="#attributionModal">
                            View Attribution
                        </button>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <div class="content">
        <div class="container py-3">

            <div class="row mb-3">

                <!-- local time card -->
                <div class="col-md-3 d-flex align-items-stretch">
                    <?php include '../components/localTime.php'; ?>
                </div>

                <!-- Sunrise/sunset card -->
                <div class="col-md-5 d-flex align-items-stretch">
                    <div class="card w-100">

                        <?php include '../components/sunCycle.php'; ?>

                    </div>
                </div>

                <div class="col-md-4 d-flex align-items-stretch">
                    <?php include '../components/windCard.php'; ?>
                </div>

            </div>

            <div class="row mb-3">

                <div class="col-md-12">
                    <!-- Map card 1 -->
                    <?php include '../components/map.php'; ?>
                </div>

            </div>


            <div class="row mb-3">

                <div class="col-md-4 d-flex align-items-stretch">
                    <?php
                    include '../components/currencyCard.php'
                        ?>
                </div>

                <div class="col-md-4 d-flex align-items-stretch">
                    <?php include '../components/populationCard.php' ?>
                </div>

                <div class="col-md-4 d-flex align-items-stretch">
                    <?php
                    include '../components/languageCard.php'
                        ?>
                </div>

            </div>


            <div class="row mb-3">

                <div class="col-md-12">
                    <!-- Forecast card -->
                    <?php include '../components/weatherForecast.php'; ?>
                </div>

            </div>

        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="attributionModal" tabindex="-1" aria-labelledby="attributionLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="attributionLabel">Attributions</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Weather data provided by <a href='https://openweathermap.org/'>OpenWeather</a>
                    <img src='../styles/images/openWeather.png' height='40px'>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Custom JS files -->
    <script src="../js/cityViewTwinSelect.js"></script>
    <script src="../js/localTime.js"></script>
</body>

</html>