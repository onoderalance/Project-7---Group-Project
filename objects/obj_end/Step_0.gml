/// @description Insert description here
// You can write your code in this editor

//plays sounds and returns to "title" screen upon contact with player
if(place_meeting(x,y,obj_player) && !m_hasWon)
{
	audio_play_sound(snd_win,1000,false);
	//add one max heart?
	global.maxHealth += 2;
	m_hasWon = true;
	obj_screenFade.alarm[1] = 1;
} 

//waits 2 seconds before proceeding to "win" room
if(m_hasWon)
{
	if(m_winTimer%5==0 && global.health < global.maxHealth)
		global.health++;
	m_winTimer++;
	if(m_winTimer >= room_speed*2)
		room_goto(rm_win);
}


