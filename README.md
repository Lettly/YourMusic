# yourMusic

<img src="https://1000marche.net/wp-content/uploads/2020/03/Spotify-logo.png" style="width:50%">
Request a song with Spotify API

<h1>Requirements</h1>
For setup the project, you need to create a spotify applications in your developer dashboard.

<a href="https://developers.spotify.com/dashboard" target="_blank">https://developers.spotify.com/dashboard</a>

<h1>Configurations</h1>
To setup your account, go to <i>docker-compose.yml</i> and add your spotify app configurations like:

-   client ID
-   Client Secret
-   Link your domain callback url

<i>NB: In you spotify dashboard, go to app settings and add callback.php url in <b>Redirect URIs</b>.</i>
<br><br>

After this, you need to go to auth.php via browser and connect your spotify account

<h1>Start</h1>
To start the project, you need to run the command:

```bash
chmod 777 api/v1/data
docker-compose up -d
```

<h2>Enjoy!</h2>
