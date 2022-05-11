/// @description Insert description here
// You can write your code in this editor


//sets switch sprites based on level
switch(global.level)
{
	case 0:
		m_frame1 = 0;
		m_frame2 = 1;
		break;
	case 1:
		m_frame1 = 2;
		m_frame2 = 3;
		break;
}

//determines sprite shown (pressed or not)
if(!global.switchHit[switchID])
	image_index = m_frame1;
else
	image_index = m_frame2;

//presses switch upon contact with player
if(place_meeting(x,y,obj_player))
{
	global.switchHit[switchID] = true;
}