<?php

// Function to fetch cities from the database
// Include the configuration file or define constants for DB connection
include '../config.php';
//DB_NAME = 'DSA-TWIN-CITIES';

// Function to establish database connection
function connectToDatabase()
{
    try {
        $conn = new PDO("mysql:host=" . SERVER_NAME . ";dbname=" . DB_NAME, USERNAME, PASSWORD);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        return null;
    }
}

// Function to fetch all cities from the database
function getAllCities()
{
    $conn = connectToDatabase();
    if ($conn) {
        try {
            $sql = "SELECT * FROM base_cities";
            $stmt = $conn->prepare($sql);
            $stmt->execute();
            $cities = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $cities;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return [];
        } finally {
            $conn = null; // Close connection
        }
    }
    return [];
}

// Gets a list of all the base cities
function getBaseCities()
{
    $conn = connectToDatabase();
    if ($conn) {
        try {
            $sql = "SELECT DISTINCT base_cities.Name, base_cities.CityID, twinned_data.base_city  
            FROM twinned_data 
            INNER JOIN base_cities ON twinned_data.base_city = base_cities.CityID";

            $stmt = $conn->prepare($sql);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return [];
        } finally {
            $conn = null; // Close connection
        }
    }
    return [];
}

function getTwinCities($base)
{
    $conn = connectToDatabase();
    if ($conn) {
        try {
            $sql = "SELECT base_cities.Name AS BaseCityName, base_cities.CityID AS BaseCityID, twinned_data.*, twin_cities.Name AS TwinCityName, twin_cities.CityID AS TwinCityID
                    FROM twinned_data 
                    INNER JOIN base_cities ON twinned_data.base_city = base_cities.CityID
                    INNER JOIN base_cities AS twin_cities ON twinned_data.twin_city = twin_cities.CityID
                    WHERE base_cities.CityID = :base";

            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':base', $base);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return [];
        } finally {
            $conn = null; // Close connection
        }
    }
    return [];
}

// Generic function to fetch city data from the database and store it in an associative array
function fetchCityData($cityID)
{
    $conn = connectToDatabase();
    if ($conn) {
        try {
            $sql = "SELECT * FROM base_cities WHERE CityID = :cityID";

            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':cityID', $cityID); // Use $cityID instead of $CityID
            $stmt->execute();
            $city = $stmt->fetch(PDO::FETCH_ASSOC); // Use fetch() instead of fetchAll()

            // Return the city data
            return $city;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return null;
        } finally {
            $conn = null; // Close connection
        }
    }
    return null;
}
function fetchPoiData($cityID)
{
    $conn = connectToDatabase();
    if ($conn) {
        try {
            $sql = "SELECT * FROM poi_data WHERE CityID = :cityID";

            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':cityID', $cityID); // Use $cityID instead of $CityID
            $stmt->execute();
            $poi = $stmt->fetchAll(PDO::FETCH_ASSOC); // Use fetchAll() instead of fetch()

            // Return the city data
            return $poi;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return null;
        } finally {
            $conn = null; // Close connection
        }
    }
    return null;
}

function fetchPoi($poiID)
{
    $conn = connectToDatabase();
    if ($conn) {
        try {
            $sql = "SELECT * FROM poi_data WHERE PointOfInterestID = :poiID";

            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':poiID', $poiID);
            $stmt->execute();
            $poi = $stmt->fetch(PDO::FETCH_ASSOC); // Use fetch() instead of fetchAll()

            // Return the poi data
            return $poi;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return null;
        } finally {
            $conn = null; // Close connection
        }
    }
    return null;
}

function fetchAllPoi()
{
    $conn = connectToDatabase();
    if ($conn) {
        try {
            $sql = "SELECT * FROM poi_data";
            $stmt = $conn->prepare($sql);
            $stmt->execute();
            $poi = $stmt->fetchAll(PDO::FETCH_ASSOC); 
            // Return the poi data
            return $poi;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return null;
        } finally {
            $conn = null; // Close connection
        }
    }
    return null;
}

?>