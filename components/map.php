<div class="card">
    <div class="card-body">
        <h5 class="text-muted">Map</h5>

        <!-- Map container box -->
        <div style="height: 450px; border-radius: 0.35rem;" id="map"></div>
        <div id="mapError" class="alert alert-danger" role="alert" style="display: none;">
            Error loading the map for <?php echo $cityData['CityName']; ?>
        </div>
    </div>
</div>
<?php
// Encode the city data and make it available to JS
$cityDataJson = json_encode($cityData);
echo "<script>const cityDataJson = $cityDataJson;</script>";

// Encode the POI data and make it available to JS
$poiDataJson = json_encode($poiData);
echo "<script>const poiDataJson = $poiDataJson;</script>";
echo '<script>const base = ' . json_encode($_GET['base']) . ';</script>';
if (isset($_GET['twin'])) {
    echo '<script>const twin = ' . json_encode($_GET['twin']) . ';</script>';
}
?>

<script>
// Instantiate the map object
const lat = cityDataJson['Latitude'];
const long = cityDataJson['Longitude'];
const zoom = 12.5;
const map = L.map('map').setView([lat, long], zoom);

// Load openStreetMap tiles
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

poiDataJson.forEach(POI => {
    // Extract latitude and longitude for each POI
    const latitude = parseFloat(POI['Latitude']);
    const longitude = parseFloat(POI['Longitude']);

    // Add a map marker for the current POI
    const marker = L.marker([latitude, longitude]).addTo(map);

    // Add popup that appears on hover for each marker
    marker.bindPopup(
        `<p><strong>${POI['Name']}</strong><br>${POI['History']}</p>`
    );

    // Open the popup on mouseover
    marker.on('mouseover', function() {
        this.openPopup();
    });

    // Close the popup on mouseout
    marker.on('mouseout', function() {
        this.closePopup();
    });

    marker.on('click', function() {
        // Get the current URL
        var currentURL = window.location.href;

        // Split the URL by '/'
        var urlParts = currentURL.split('/');

        // Get the last part (top-level file name)
        var topLevelFileName = urlParts.pop();

        // Replace the last part with 'poiView.php'
        topLevelFileName = 'poiView.php';

        // Construct the updated URL
        urlParts.push(topLevelFileName);
        var newURL = urlParts.join('/');

        // Append the query parameters
        newURL += "?poi=" + POI['PointOfInterestID'] +
            "&base=" + encodeURIComponent(base);

        // If twin is defined
        if (typeof twin !== 'undefined') {
            newURL += "&twin=" + encodeURIComponent(twin);
        }

        // Open the new page
        window.open(newURL);

    });

});
</script>