# yourMusic

<img src="https://1000marche.net/wp-content/uploads/2020/03/Spotify-logo.png" style="width:50%">
Request a song with Spotify API

<h1>Requirements</h1>
For setup the projects, you need to create a spotify applications in your developer dashboard.

<a href="https://developers.spotify.com/dashboard" target="_blank">https://developers.spotify.com/dashboard</a>

<h1>Configurations</h1>
To setup your account, go to <i>include/config.php</i> and add your spotify app configurations like:

 - client ID
 - Client Secret
 - Link your domain callback url
 
<i>NB: In you spotify dashboard, go to app settings and add callback.php url in <b>Redirect URIs</b>.</i>
<br><br>


Furthermore, you need to import .sql file in database and setup database connections with:

- mysql ip
- mysql username
- mysql password
- mysql database name

After this, you need to go to auth.php via browser and connect your spotify account

<h2>Enjoy!</h2>
