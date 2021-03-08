<?php
	
	$url = "mysql:host=localhost;dbname=utilisateurs";
	$dbuser = "student";
	$dbpw = "toor";
	
	$user_username = $_POST['user'];
	$user_pw = $_POST['pw'];

	try
	{
		$dbcon = new PDO($url, $dbuser, $dbpw);
		$dbcon->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        
		$cmd = $dbcon->prepare("SELECT nom,prenom FROM utilisateur WHERE user=? AND pw=?;");
        $data = array($user_username, $user_pw);
        $cmd->execute($data);
        
        $out = "";
        $line;
        
        while($line = $cmd->fetchObject())
		{
			$out .= "$line->nom"." "."$line->prenom";
		}
	}
	
	catch(Exception $ex)
	{
		$out = $ex->getMessage();
	}
	
	echo $out;
?>


