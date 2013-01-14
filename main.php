<?
require("class.inc.php");
$users = new Users();
$codes = new Codes();
session_start();
if(isset($_GET['setsession'])) {
	foreach($_POST as $key => $val) {
		$_SESSION[$key] = $val;
	}
}
else if(isset($_GET['checklogin'])) {
	if(($x = $users->CheckLogin($_POST['name'] , $_POST['password'])) != 0) { $_SESSION['login'] = $_POST['name']; $_SESSION['id'] = $x; echo 'true'; }
	else echo 'false';
}
else if(isset($_GET['logout'])) {
	session_unset();
	session_destroy();
	
}
else if(isset($_GET['addcode'])) {
	$codes -> AddCode($_POST['code'], $_POST['jezyk'], $_SESSION['id'], $_POST['nazwa']);
	
}
else if(isset($_GET['allcodes'])) {
	$codes -> ListAllCodes($_SESSION['id']);
}
else if(isset($_GET['getcode'])) {
	$codes -> GetCode($_GET['id']);
}
else if(isset($_GET['deletecode'])) {
	$codes -> DeleteCode($_GET['id']);
}
else if(isset($_GET['iflogged'])) {
	if(isset($_SESSION['id'])) echo 'true';
	else echo 'false';
}
?>