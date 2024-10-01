<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POI view | Twin Cities</title>

    <!-- Link to Bootstrap CSS -->
    <link rel="stylesheet" href="../styles/bootstrap/bootstrap.min.css">

    <!-- Custom CSS file -->
    <link rel="stylesheet" href="../styles/custom.css">

    <!-- Leaflet map library -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
        integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="">
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
</head>

<body>

    <?php
    include '../components/dbFuncs.php';
    include '../components/utilityFuncs.php';

    $poi = fetchPoi($_GET["poi"]);
    ?>

    <nav class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">
                <?php echo $poi['Name']; ?>
            </span>
        </div>
    </nav>

    <div class="container py-3">

        <div class="row mb-3">

            <div class="col-md-6 d-flex align-items-stretch">
                <div class="card w-100">
                    <div class="card-body">
                        <h5 class="text-muted">History</h5>
                        <?PHP echo $poi['History']; ?>
                    </div>
                </div>
            </div>

            <div class="col-md-6">

                <div class="row">

                    <div class="col-md-12 mb-3">
                        <div class="card w-100">
                            <div class="card-body">
                                <h5 class="text-muted">Geo-Location</h5>
                                <p>
                                    <strong>
                                        <i class="bi bi-geo"></i> Long:
                                    </strong>
                                    <?php echo $poi['Longitude']; ?>
                                </p>
                                <p>
                                    <strong>
                                        <i class="bi bi-geo"></i> Lat:
                                    </strong>
                                    <?php echo $poi['Latitude']; ?>
                                </p>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="card w-100">
                            <div class="card-body">
                                <h5 class="text-muted">Wikilink:</h5>
                                <a href="<?php echo $poi['Wikilink']; ?>" target="_blank"><button type="button"
                                        class="btn btn-primary">See Wiki</button></a>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- Custom JS files -->
    <script src="../js/cityViewTwinSelect.js"></script>

    <!-- Bootstrap JS -->
    <script src="../styles/bootstrap/bootstrap.min.js"></script>
</body>

</html>