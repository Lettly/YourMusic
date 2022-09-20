<?php
     require '../../include/config.php';
     require '../../vendor/autoload.php';

    $session = new SpotifyWebAPI\Session(
        $spotify_client_id,
        $spotify_client_secret,
        $spotify_redirect_uri
    );


    // Request a access token using the code from Spotify
    $session->requestAccessToken($_GET['code']);

    $accessToken = $session->getAccessToken();
    $refreshToken = $session->getRefreshToken();
    
    // Create connection
    $conn = new mysqli($mysql_ip, $mysql_username, $mysql_password, $mysql_dbname);
    // Check connection
    if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }

    $sql = "UPDATE opzioni SET token='$accessToken', refresh_token='$refreshToken' where id=1";

    if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
    } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
    echo "<br>". $accessToken;
    // Send the user along and fetch some data!
    // header('Location: hbidfajhvdfsavhj.php');
    // die();