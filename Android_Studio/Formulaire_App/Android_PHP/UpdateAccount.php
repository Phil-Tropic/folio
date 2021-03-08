<?php
	
	$url = "mysql:host=localhost;dbname=utilisateurs";
	$dbuser = "root";
	$dbpw = "";

    $nom = $_POST['nom'];
    $prenom = $_POST['prenom'];
    $travail = $_POST['travail'];
    $user_username = $_POST['user'];
    $user_pw = $_POST['pw'];

	try
	{
		$dbcon = new PDO($url, $dbuser, $dbpw);
		$dbcon->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		
		$cmd = $dbcon->prepare("UPDATE utilisateur SET nom='$nom',prenom='$prenom',travail='$travail',user='$user_username',pw='$user_pw' WHERE user='$user_username';");
		$data = array($nom,$prenom,$travail,$user_username,$user_pw);
        
		$cmd->execute($data);
		$out = "";
	}
	
	catch(Exception $ex)
	{
		$out = $ex->POSTMessage();
	}
	
	echo $out;
?>


