<?php
	
	$url = "mysql:host=localhost;dbname=utilisateurs";
	$dbuser = "root";
	$dbpw = "";
	
    $titre = $_POST['titre'];

	try
	{
		$dbcon = new PDO($url,$dbuser,$dbpw);
		$dbcon->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		
		$cmd = $dbcon->prepare("INSERT INTO activites(titre) VALUES(?);");
		$data = array($titre);
        
		$cmd->execute($data);
		$out = "";
	}
	
	catch(Exception $ex)
	{
		$out = $ex->getMessage();
	}
	
	echo $out;
?>