<?php

class User {
  
  private $id;
  public function getId () { return $this->id; }
  private function setId ($id) { $this->id = $id; }

  private $idCard; 
  public function getIdCard () { return $this->idCard; }
  public function setIdCard ($idCard) { $this->idCard = $idCard; }

  private $name; 
  public function getName () { return $this->name; }
  public function setName ($name) { $this->name = $name; }

  private $lastName; 
  public function getLastName () { return $this->lastName; }
  public function setLastName ($lastName) { $this->lastName = $lastName; }

  private $phone; 
  public function getPhone () { return $this->phone; }
  public function setPhone ($phone) { $this->phone = $phone; }

  private $email; 
  public function getEmail () { return $this->email; }
  public function setEmail ($email) { $this->email = $email; }

  private $username;
  public function getUsername () { return $this->username; }
  public function setUsername ($username) { $this->username = $username; }

  private $password;
  public function getPassword () { return $this->password; }
  public function setPassword ($password) { $this->password = $password; }

  private $role;
  public function getRole () { return $this->role; }
  public function setRole ($role) { $this->role = $role; }

 
  private $message;
  public function getMessage () { return $this->message; }
  public function setMessage ($message) { $this->message = $message; }

  public function __construct(
    $username,
    $password,
    $idCard = '',
    $name = '',
    $lastName = '',
    $phone = '',
    $email = '',
    $role = '',
    $id = null
  ) {
    $this->idCard = $idCard;
    $this->name = $name;
    $this->lastName = $lastName;
    $this->phone = $phone;
    $this->email = $email;
    $this->username = $username;
    $this->password = $password;
    $this->role = $role;
    $this->id = $id;
  }

  public function Login() {
    
    $db = (new DataBase())->CreateConnection();
    $statement = $db->prepare('SELECT `ID`, `PASSWORD` FROM `users` WHERE `USERNAME` = ?');
    
    $statement->bind_param('s', $this->username);
    $statement->bind_result($id, $password);

    $id = null;

    if ($statement->execute()) {
      while ($row = $statement->fetch()) {
        if (password_verify($this->password, $password)) {
          $id = $ID;
        }
      }
    }

    return $id;

  }
   
  public static function GetUserById ($id) {
    $model = null;
    $db = (new DataBase())->CreateConnection();
    $statement = $db->prepare('SELECT `USERNAME`, `PASSWORD`, `IDCARD`, `NAME`, `LASTNAME`, `PHONE`, `EMAIL`, `ROLE`, `ID` FROM `users` WHERE `ID` = ?');
    $statement->bind_param('i', $id);
    $statement->bind_result($username, $password, $idCard, $name, $lastName, $phone, $email, $role, $id);
    if ($statement->execute()) {
      while ($row = $statement->fetch()) {
        $model = new User($username, $password, $idCard, $name, $lastName, $phone, $email, $role, $id);
      }
    }
    return $model;
  }

  public static function GetAllUsers () {
    $models = [];
    $db = (new DataBase())->CreateConnection();
    $statement = $db->prepare('SELECT `USERNAME`, `PASSWORD`, `IDCARD`, `NAME`, `LASTNAME`, `PHONE`, `EMAIL`, `ROLE`, `ID` FROM `users`');
    $statement->bind_result($username, $password, $idCard, $name, $lastName, $phone, $email, $role, $id);
    if ($statement->execute()) {
      while ($row = $statement->fetch()) {
        $model = new User($username, $password, $idCard, $name, $lastName, $phone, $email, $role, $id);
        array_push($models, $model);
      }
    }
    return $models;
  }


  public function Create () {
    $db = (new DataBase())->CreateConnection();
    $statement = $db->prepare(
      'INSERT INTO `users` (`IDCARD`, `NAME`, `LASTNAME`, `PHONE`, `EMAIL`, `USERNAME`, `PASSWORD`, `ROLE`) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)'
    );
    $pwd = Security::HashPassword($this->password);
    $statement->bind_param(
      'ssssssss',
      $this->idCard,
      $this->name,
      $this->lastName,
      $this->phone,
      $this->email,
      $this->username,
      $pwd,
      $this->role
    );
    $statement->execute();
  }

  public function Edit () {
    $db = (new DataBase())->CreateConnection();
    $statement = $db->prepare(
      'UPDATE `users` 
      SET 
        `IDCARD`=?,
        `NAME`=?,
        `LASTNAME`=?,
        `PHONE`=?,
        `EMAIL`=?,
        `USERNAME`=?,
        `PASSWORD`=?,
        `ROLE`=? 
      WHERE `ID`=?'
    );
    $pwd = Security::HashPassword($this->password);
    $statement->bind_param(
      'ssssssssi',
      $this->idCard,
      $this->name,
      $this->lastName,
      $this->phone,
      $this->email,
      $this->username,
      $pwd,
      $this->role,
      $this->id
    );
    $statement->execute();
  }


  public function Delete () {
    $db = (new DataBase())->CreateConnection();
    $statement = $db->prepare('DELETE FROM `users` WHERE `ID` = ?');
    $statement->bind_param('i', $this->id);
    $statement->execute();
  }

  public function ToAssociativeArray () {
    return array(
      'ID' => $this->id,
      'IDCARD' => $this->idCard,
      'NAME' => $this->name,
      'LASTNAME' => $this->lastName,
      'PHONE' => $this->phone,
      'EMAIL' => $this->email,
      'USERNAME' => $this->username,
      'PASSWORD' => $this->password,
      'ROLE' => $this->role,
      'MESSAGE' => $this->message
    );
  }

}
?>