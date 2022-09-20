<?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    require $_SERVER["DOCUMENT_ROOT"].'/vendor/autoload.php';

    $session = new SpotifyWebAPI\Session(
        '37d6c9873a1b43ba94ae81466803dcb7',
        '5c9c46d909fe4046836d52ddc5315373',
    );


    $servername = "217.182.206.163";
    $username = "admin";
    $password = "Andro.2001";
    $dbname = "yourmusic";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT refresh_token, token, volume FROM opzioni";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $accessToken = $row["token"];
        $refreshToken = $row["refresh_token"];
        $volume = $row['volume'];
    }
    } else {
    echo "0 results";
    }
    $conn->close();


    // Use previously requested tokens fetched from somewhere. A database for example.
    if ($accessToken) {
        $session->setAccessToken($accessToken);
        $session->setRefreshToken($refreshToken);
    } else {
        // Or request a new access token
        $session->refreshAccessToken($refreshToken);
    }

    $options = [
        'auto_refresh' => true,
    ];



    $api = new SpotifyWebAPI\SpotifyWebAPI($options, $session);

    // Fetch the saved access token from somewhere. A database for example.
    
    // hot hits italia playlist
    var_dump($api->changeVolume(['volume_percent' => $volume+$_GET['v'],]));