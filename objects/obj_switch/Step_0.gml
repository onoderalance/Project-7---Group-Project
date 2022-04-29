/// @description Insert description here
// You can write your code in this editor

//determines sprite shown (pressed or not)
if(!global.switchHit[switchID])
	image_index = 0;
else
	image_index = 1;

//presses switch upon contact with player
if(place_meeting(x,y,obj_player))
{
	global.switchHit[switchID] = true;
}