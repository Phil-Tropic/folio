<?php
class DataBase {
  
  private $hostname;
  private $database;
  private $username;
  private $password;

  public function __construct(
    $hostname= 'localhost',
    $database= 'id16305709_cyclo',
    $username= 'id16305709_root',
    $password= 'Chanvre11!!22'
  ) {
    $this->hostname = $hostname;
    $this->database= $database;
    $this->username= $username;
    $this->password= $password;
  }

  public function CreateConnection() {
    $db = new mysqli($this->hostname, $this->username, $this->password, $this->database);
    if($db->connect_error){
      throw new Exception('Connection failed ('.$db->connect_errno.')');
    }
    return $db;
  }

}
?>