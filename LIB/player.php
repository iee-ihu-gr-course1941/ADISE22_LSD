<?php

require_once "game.php";

function handle_user($method, $b,$input) {
	if($method=='GET') {
		show_user($b);
	} else if($method=='PUT') {
        set_user($b,$input);
    }

	
}

function show_user($b) {
	global $mysqli;
	$sql = 'select * from users where user=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$b);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function set_user($b, $input){if(!isset($input['username']) || $input['username']=='') {
    header("HTTP/1.1 400 Bad Request");
    print json_encode(['errormesg'=>"No username given."]);
    exit;
}

$name=$input['username'];
global $mysqli;
$sql = 'select count(*) as c from users where user=? and username is not null';
$st = $mysqli->prepare($sql);
$st->bind_param('s',$b);
$st->execute();
$res = $st->get_result();
$r = $res->fetch_all(MYSQLI_ASSOC);
if($r[0]['c']>0) {
    header("HTTP/1.1 400 Bad Request");
    print json_encode(['errormesg'=>"Player $b is already set. Please wait your set hand ."]);
    exit;
}

$sql = 'update users set username=?, token=md5(CONCAT( ?, NOW())) ,lastChange=NOW() where user=?';
$st2 = $mysqli->prepare($sql);
$st2->bind_param('sss',$name,$name,$b);
$st2->execute();

update_game_status();
$sql = 'select * from users where user=?';
$st = $mysqli->prepare($sql);
$st->bind_param('s',$b);
$st->execute();
$res = $st->get_result();
header('Content-type: application/json');
print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

?>
