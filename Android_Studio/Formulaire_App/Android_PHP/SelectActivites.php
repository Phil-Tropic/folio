<?php
	
	$url = "mysql:host=localhost;dbname=utilisateurs";
	$dbuser = "root";
	$dbpw = "";
	

	try
	{
		$dbcon = new PDO($url,$dbuser,$dbpw);
		$dbcon->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		
		$cmd = $dbcon->prepare("SELECT * FROM activites;");
        $cmd->execute();
		
		$out = "";
		$line;
		
		while($line = $cmd->fetchObject())
		{
			$out .= "$line->titre"." "." "."";
		}
	}
	
	catch(Exception $ex)
	{
		$out = $ex->getMessage();
	}
	
	echo $out;

    //Script testé seul et fonctionnel
?>


