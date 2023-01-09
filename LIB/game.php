<?php

function show_status()
{
	global $mysqli;

	$sql = 'select * from gamestatus';
	$st = $mysqli->prepare($sql);

	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);

}

function update_game_status() {
	global $mysqli;
	
	$sql = 'select * from gamestatus';
	$st = $mysqli->prepare($sql);

	$st->execute();
	$res = $st->get_result();
	$status = $res->fetch_assoc();
	
	
	$new_status=null;
	$new_turn=null;
	

	$sql='select count(*) as aborted from users WHERE lastChange< (NOW() - INTERVAL 1 MINUTE)';
    $st3 = $mysqli->prepare($sql);
    $st3->execute();
    $res3 = $st3->get_result();
    $aborted = $res3->fetch_assoc()['aborted'];
    if($aborted>0) {
        $sql ='update users set userName = null, token = null , lastChange = null where lastChange < (now() - interval 1 MINUTE)';
        $st2 = $mysqli->prepare($sql);
        $st2->execute();

		
        if($status['gameStatus']=='started') {
            $new_status='aborted';


			
        }
		
		

    }

	
	$sql = 'select count(*) as c from users where username is not null';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$active_players = $res->fetch_assoc()['c'];

	




	switch($active_players) 
    {
		case 0:
			$new_status = 'not active';
					global $mysqli;
	
				$sql = 'call clean_deck()';
				$mysqli->query($sql);
						 break;
        case 1: $new_status='initialized';
		
				global $mysqli;
	
				$sql = 'call shuffle()';
				$mysqli->query($sql);

						break;

        case 2: $new_status='started';

            if($status['turn']==null) 
            {
                $new_turn='X'; // It was not started before...
            }
            break;
    }

	$sql = 'update gamestatus set gameStatus=?, playerTurn=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ss',$new_status,$new_turn);
	$st->execute();		
}

?>
