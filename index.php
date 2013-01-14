<!doctype html>
<html>
<head>
<title>Projekt</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/codemirror.js"></script>
<link rel="stylesheet" href="lib/codemirror.css">
<link rel="stylesheet" href="lib/file-upload.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="mode/javascript/javascript.js"></script>
<script type="text/javascript" src="mode/php/php.js"></script>
<script type="text/javascript" src="mode/clike/clike.js"></script>
<script type="text/javascript" src="mode/http/http.js"></script>
<script type="text/javascript" src="projekt.js"></script>
<script type="text/javascript" src="plugin.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jNotify.jquery.css" media="screen">
<script type="text/javascript" src="js/jnotify.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <style type="text/css">
      .CodeMirror {border-top: 1px solid black; border-bottom: 1px solid black; height:100%;}
	  .activeline {background: #e8f2ff !important;}
	  .ui-dialog .ui-state-error { padding: .3em; }
      .validateTips { border: 1px solid transparent; padding: 0.3em; }
    </style>
</head>
<body>
<?
session_start();

?>
<div id="kody" class="modal hide fade" tabindex="-1" role="dialog" aria-hidden="true">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h3 id="myModalLabel">Moje kody</h3>
</div>
<div class="modal-body">

</div>
<div class="modal-footer">
<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
</div>
</div>
<div id="zapisz-form" title="Zapisz kod">
    <p class="validateTips"></p>
 
    <form id="zapisz">
    <fieldset>
        <label for="name">Nazwa</label>
        <input type="text" name="name" id="savename" class="text ui-widget-content ui-corner-all" />
    </fieldset>
    </form>
</div>
	<div id="register-form" title="Rejestracja">
    <p class="validateTips">Wszystkie pola są wymagane.</p>
 
    <form id="register">
    <fieldset>
        <label for="name">Login</label>
        <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
        <label for="password">Hasło</label>
        <input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all" />
    </fieldset>
    </form>
</div>
	<div id="login-form" title="Logowanie">
    <p class="validateTips">Wszystkie pola są wymagane.</p>
 
    <form id="loginform">
    <fieldset>
        <label for="name">Login</label>
        <input type="text" id="logname" name="name" class="text ui-widget-content ui-corner-all" />
        <label for="password">Hasło</label>
        <input type="password" id="logpassword" name="password" value="" class="text ui-widget-content ui-corner-all" />
    </fieldset>
    </form>
</div>
    <div class="navbar">
    <div class="navbar-inner">
    <div class="container">
     
    <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    </a>
     
    <!-- Be sure to leave the brand out there if you want it shown -->
    <a class="brand" href="#">Edytor</a>
     
    <!-- Everything you want hidden at 940px or less, place within here -->
    <div class="nav-collapse collapse">
	                    <ul class="nav">
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="jezyk">Wybierz język <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li><a href="#" onclick="changeMode('clike', 'C, C++, Java')">C, C++, Java</a></li>
                          <li><a href="#" onclick="changeMode('javascript', 'JavaScript')">JavaScript</a></li>
                          <li><a href="#" onclick="changeMode('php', 'PHP')">PHP</a></li>
						  <li><a href="#" onclick="changeMode('http', 'HTTP')">HTTP</a></li>
                        </ul>
                      </li>
                      <li><a href="#" id="savebutton">Zapisz</a></li>
                      <li class="file-upload">
			<a>Wczytaj plik</a>
			<input type="file" name="uploadfile" id="plik" style="width:0px;overflow:hidden">
					  </li>
					  </ul>
					  <ul class="nav pull-right">
					  <li id="mycodes"><? if (isset($_SESSION['login'])) echo '<a href="#kody" id="mycodesbutton" data-toggle="modal">Moje kody</a>'; ?></li>
					  <li style="display:block;padding: 10px 15px 10px;color: #777777;">Zalogowany jako:</li>
					  <li id="login" style="display:block;padding: 10px 15px 10px;color: #777777;"><? if (!isset($_SESSION['login']))
echo 'Gość'; else echo $_SESSION['login']; ?></li><li id="logoutli">
						<? if(isset($_SESSION['login'])) { ?> <a href="#" id="logoutbutton">Wyloguj</a><? } ?></li> 
					  <li><a href="#" id="logbutton">Logowanie</a></li>
					  <li><a href="#" id="regbutton">Rejestracja</a></li>
                    </ul>
    <!-- .nav, .navbar-search, .navbar-form, etc -->
    </div>
     
    </div>
    </div>
    </div>
	<form>
	<div style="width:100%; height:500px;border:1px;" id="container"><textarea id="editor"></textarea></div>
	</form>
</body>
</html>