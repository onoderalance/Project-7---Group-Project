/// @description Insert description here
// You can write your code in this editor

//triggers alarm to self-destruct if linked switch has been hit
if(global.switchHit[switchID])
	alarm[0] = 1;

//modified depth sorting that wont ever covered the player
depth = max(-y,obj_player.depth+1);

image_index = global.level;

