document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('twinForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent form submission

        var selectedTwin = document.getElementById('twin').value; // Get selected value

        // Get current URL
        var url = new URL(window.location.href);
        var searchParams = new URLSearchParams(url.search);

        // Check if 'twin' parameter exists
        if (searchParams.has('twin')) {
            // Update 'twin' parameter value
            searchParams.set('twin', selectedTwin);
        } else {
            // Add 'twin' parameter
            searchParams.append('twin', selectedTwin);
        }

        // Update URL with modified parameters
        url.search = searchParams.toString();

        // Redirect to the updated URL
        window.location.href = url.toString();
    });
});