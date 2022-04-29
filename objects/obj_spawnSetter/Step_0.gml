/// @description Insert description here
// You can write your code in this editor

//saves coordinates when touched (to respawn player after falling)
if(place_meeting(x,y,obj_player))
{
	global.lastX = x;
	global.lastY = y;
}

