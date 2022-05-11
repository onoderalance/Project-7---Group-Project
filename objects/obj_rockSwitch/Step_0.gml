/// @description Insert description here
// You can write your code in this editor

//determines sprite shown (pressed or not)
if(!global.switchHit[switchID])
	image_index = 0;
else
	image_index = 1;

//presses switch upon contact with player
var rock = instance_place(x,y,obj_rock)
if(rock != noone)
{
	with(rock)
	{
		m_rockSet = true;
	}
	global.switchHit[switchID] = true;
}
