<?php

require_once "LIB/dbconnect.php";
require_once "LIB/deck.php";
require_once "LIB/game.php";
require_once "LIB/player.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
$request_path = trim($_SERVER['PATH_INFO'],'/');
$input = json_decode(file_get_contents('php://input'),true);

if($input==null) {
    $input=[];
}

if(isset($_SERVER['HTTP_X_TOKEN'])) {
    $input['token']=$_SERVER['HTTP_X_TOKEN'];
} else {
    $input['token']='';
}

if (preg_match('/^deck$/', $request_path, $matches) ) {
if($method=='GET') { show_deck(/*$input*/);}
elseif($method=='POST') { reset_deck();  /*show_deck($input);**/}
    else { header('HTTP/1.1 405 Method Not Allowed');}
} else if (preg_match('/^status$/', $request_path, $matches )) {
    if ($method == 'GET') {
    update_game_status(); 
        show_status();

}
    else {header('HTTP/1.1 405 Method Not Allowed');}
} else if (preg_match('/^player\/((A)|(B))$/', $request_path, $matches) ) {
    if($method=='GET') { show_user($matches[1]);} 
    elseif($method=='PUT') { set_user($matches[1],$input);}
    else  {header('HTTP/1.1 405 Method Not Allowed');}
} else if (preg_match('/^player\/([^BW])$/', $request_path, $matches) ) {
        header("HTTP/1.1 404 Not Found");
		print json_encode(['errormesg'=>"Player ($matches[1] not found."]);
} else {
    header("HTTP/1.1 404 Not Found");
}

?>
