<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select city | Twin Cities</title>

    <!-- Link to Bootstrap CSS -->
    <link rel="stylesheet" href="../styles/bootstrap/bootstrap.min.css">

    <!-- custom CSS file -->
    <link rel="stylesheet" href="../styles/custom.css">
</head>

<body>

    <div class="container-fluid">
        <div class="row d-flex align-items-center" style="height: 100vh;">
            <div class="col-md-5 mx-auto">

                <div class="card text-center py-2 mb-5">
                    <div class="card-body">

                        <h2 class="mb-4">Choose base city</h2>

                        <form method="GET" action="cityView.php">

                            <select class="form-select mb-3" name="base">
                                <?php
                                include '../components/dbFuncs.php';


                                // Call the function to get cities from the database
                                $baseCities = getBaseCities();

                                if (count($baseCities) > 0) {
                                    // Create a select field with all the cities
                                    foreach ($baseCities as $city) {
                                        echo '<option selected value="' . $city["CityID"] . '">' . $city["Name"] . '</option>';
                                    }
                                } else {
                                    echo '<option selected disabled>Error fetching cities!</option>';
                                }
                                ?>
                            </select>

                            <button class="btn btn-primary w-100" type="submit">
                                Submit
                            </button>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>


    <script src="../styles/bootstrap/bootstrap.min.js"></script>
</body>

</html>