// Function to update the time
function updateTime(offset) {
    // Get current time
    var now = new Date();

    // Calculate the time with the offset
    var utc = now.getTime() + (now.getTimezoneOffset() * 60000);
    var newTime = new Date(utc + (3600000 * offset));

    // Format the time
    var hours = newTime.getHours();
    var minutes = newTime.getMinutes();
    var seconds = newTime.getSeconds();

    // Add leading zeros if necessary
    hours = (hours < 10 ? '0' : '') + hours;
    minutes = (minutes < 10 ? '0' : '') + minutes;
    seconds = (seconds < 10 ? '0' : '') + seconds;

    // Display the time
    document.getElementById('localTime').innerHTML = hours + ':' + minutes + ':' + seconds;
}

// Call updateTime every second
updateTime(offset);
setInterval(function () {
    updateTime(offset);
}, 1000);