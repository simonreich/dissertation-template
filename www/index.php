<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

	<title>Your name's Thesis</title>
  </head>
  <body>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1 class="display-3">Your name's Thesis</h1>
        <p>This page will inform you about Your name's thesis progress!</p>
        <p><a class="btn btn-primary btn-lg" href=".." role="button">I really don't care &raquo;</a></p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-12">
          <h2>Progress</h2>
<?php
    $filename = 'counterpage.dat';
    $filenameHighscore = 'counterpage_highscore.dat';
    $filenameCompile = 'countercompile.dat';
    $expectedPagenr = 200;

    $pagenumber = intval(file_get_contents($filename));
	if (!isset ($pagenumber))
	{
		$pagenumber = 0;
	}

    $pagenumberHighscore = intval(file_get_contents($filenameHighscore));
	if (!isset ($pagenumberHighscore))
	{
		$pagenumberHighscore = 0;
    }

    if ($pagenumber > $pagenumberHighscore) {
        $pagenumberHighscore = $pagenumber;
        file_put_contents ($filenameHighscore, $pagenumberHighscore);
    }

    $compilenumber = intval(file_get_contents($filenameCompile));
	if (!isset ($compilenumber))
	{
		$compilenumber = 0;
    }


    echo "<p>In his latest build Your name has written $pagenumber of $expectedPagenr estimated pages!";
    echo "<div class=\"progress\"><div class=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"$pagenumber\" aria-valuemin=\"0\" aria-valuemax=\"$expectedPagenr\" style=\"width:" . 100/$expectedPagenr*$pagenumber . "%\">" . round(100/$expectedPagenr*$pagenumber, 1) . "%</div></div></p>";

    echo "<p>The current high score is at $pagenumberHighscore pages.";
    echo "<div class=\"progress\"><div class=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"$pagenumberHighscore\" aria-valuemin=\"0\" aria-valuemax=\"$expectedPagenr\" style=\"width:" . 100/$expectedPagenr*$pagenumberHighscore . "%\">" . round(100/$expectedPagenr*$pagenumberHighscore, 1) . "%</div></div></p>";

    if (file_exists($filename)) {
        date_default_timezone_set ("Europe/Berlin");
        echo "<p>Last modified: " . date ("F d, Y H:i:s", filemtime($filename)) . " Build: #" . $compilenumber . "</p>";
    }
?> 
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Your name</p>
      </footer>
    </div> <!-- /container -->


  </body>
</html>
