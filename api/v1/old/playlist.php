<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

    require $_SERVER["DOCUMENT_ROOT"].'/vendor/autoload.php';

    session_start();

    if (empty($_SESSION['accesstoken'])) {
        $session = new SpotifyWebAPI\Session(
            '37d6c9873a1b43ba94ae81466803dcb7',
            '5c9c46d909fe4046836d52ddc5315373',
        );
        

        $session->requestCredentialsToken();
        $accessToken = $session->getAccessToken();
        
        $_SESSION['accesstoken'] = $accessToken;
    } 

    $accessToken = $_SESSION['accesstoken'];


    $api = new SpotifyWebAPI\SpotifyWebAPI();

    // Fetch the saved access token from somewhere. A database for example.
    $api->setAccessToken($accessToken);
        
    $results = $api->getPlaylistTracks('spotify:playlist:37i9dQZF1DWUQru3jd69v5');

    // foreach ($results->artists->items as $artist) {
        // echo $artist->name, '<br>';
    // }:)

    echo json_encode($results);