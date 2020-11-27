// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function trigger_back_action(){
	switch room {
		case rm_gameplay: 
			room_goto(rm_mainmenu);
			break;
		case rm_mainmenu:
			game_end();
			break;
	}
}