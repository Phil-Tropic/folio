<?php
	
	$url = "mysql:host=localhost;dbname=utilisateurs";
	$dbuser = "root";
	$dbpw = "";

    $titre = $_POST['titre'];
    $rating = $_POST['rating'];

	try
	{
		$dbcon = new PDO($url, $dbuser, $dbpw);
		$dbcon->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		
		$cmd = $dbcon->prepare("UPDATE activites SET titre='$titre',rating='$rating' WHERE titre='$titre';");
		$data = array($titre,$rating);
        
		$cmd->execute($data);
		$out = "";
	}
	
	catch(Exception $ex)
	{
		$out = $ex->POSTMessage();
	}
	
	echo $out;
?>