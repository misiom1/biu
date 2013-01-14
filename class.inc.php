<?
require('config.inc.php');
try
{
	$db = new PDO(BAZA.':host=localhost;dbname='.DB, LOGIN, PASSWORD);
}
catch (PDOException $e)
{
	print "Blad polaczenia z baza!: " . $e->getMessage() . "<br/>";
	die();
}
class Users{
	public function AddUser($login, $haslo) {
		global $db;
		$s = $db->query('SELECT COUNT(*) FROM users WHERE login=\''.$login.'\'') or die(print_r($db->errorInfo(), true));
		$up = $s -> fetch();
		if($up[0] != 0) die("Użytkownik ".$login." już istnieje!");
		$s = $db->prepare('INSERT INTO users(login, haslo) VALUES(
		:login,
		SHA1(:haslo))');
		$s->bindValue(':login', $login, PDO::PARAM_STR);
		$s->bindValue(':haslo', $haslo, PDO::PARAM_STR);
		$s->execute() or die(print_r($db->errorInfo(), true));
		
	}
	public function CheckLogin($login, $haslo) {
		global $db;
		$s = $db -> prepare('SELECT COUNT(*), id FROM users WHERE login=:login AND haslo=SHA1(:haslo)');
		$s -> bindValue(':login', $login, PDO::PARAM_STR);
		$s -> bindValue(':haslo', $haslo, PDO::PARAM_STR);
		$s -> execute() or die(print_r($db->errorInfo(), true));
		$up = $s -> fetch();
		if($up["COUNT(*)"] == 0) return 0;
		else return $up["id"];
	}
}
class Codes{
	public function AddCode($code, $language, $id_user, $name) {
		global $db;
		$s = $db -> prepare('INSERT INTO codes(id_user, code, jezyk, nazwa) VALUES(:id_user, :code, :jezyk, :nazwa)');
		$s -> bindValue(':id_user', $id_user, PDO::PARAM_INT);
		$s -> bindValue(':code', $code, PDO::PARAM_STR);
		$s -> bindValue(':jezyk', $language, PDO::PARAM_STR);
		$s -> bindValue(':nazwa', $name, PDO::PARAM_STR);
		$s -> execute() or die(print_r($db->errorInfo(), true));
	}
	public function ListAllCodes($id_user) {
		global $db;
		$s = $db -> prepare('SELECT * FROM codes WHERE id_user = :id_user');
		$s -> bindValue(':id_user', $id_user, PDO::PARAM_INT);
		$s -> execute() or die(print_r($db->errorInfo(), true));
		echo '<table id="rounded-corner">';
		echo '<thead>';
    	echo '<tr>';
        echo '<th class="rounded-company" scope="col">Nazwa</th>';
        echo '<th class="rounded-q1" scope="col">Język</th>';
        echo '<th class="rounded-q2" scope="col">Załaduj kod</th>';
        echo '<th class="rounded-q3" scope="col">Usuń</th>';
        echo '</tr></thead><tbody>';
		//echo '<table border="1"><tr><td width="100">Nazwa</td><td width="100">Język</td><td></td></tr>';
		foreach($s as $row) {
			echo '<tr><td>'.$row['nazwa'].'</td><td>'.$row['jezyk'].'</td><td><a href="#" onclick="loadCode('.$row['id'].')">Załaduj kod</a></td><td><a href="#" onclick="deleteCode('.$row['id'].')">Usuń</a></tr>';
		}
		echo '</tbody></table>';
	}
	public function GetCode($id) {
		global $db;
		$s = $db -> prepare('SELECT * FROM codes WHERE id = :id');
		$s -> bindValue(':id', $id, PDO::PARAM_INT);
		$s -> execute() or die(print_r($db->errorInfo(), true));
		$up = $s -> fetch();
		$arr = array('code' => $up['code'], 'jezyk' => $up['jezyk'], 'nazwa' => $up['nazwa']);
		echo json_encode($arr);
	}
	public function DeleteCode($id) {
		global $db;
		$s = $db -> prepare('DELETE FROM codes WHERE id = :id');
		$s -> bindValue(':id', $id, PDO::PARAM_INT);
		$s -> execute() or die(print_r($db->errorInfo(), true));
	}
}
?>
