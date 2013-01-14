<?
require("class.inc.php");
$users = new Users();
$users->AddUser($_POST['name'], $_POST['password']);
echo 'Użytkownik dodany poprawnie';
?>