/// @description Insert description here
// You can write your code in this editor

isSolid = true;
if(!global.playingGame)
	isSolid = false;

image_index = global.level;

//plays sounds and returns to "title" screen upon contact with player
if(place_meeting(x,y,obj_player) && !m_hasWon2)
{
	//new win sound???
	audio_play_sound(snd_steps,1000,false);
	m_hasWon2 = true;
	obj_screenFade.alarm[1] = 1;
} 

//waits 2 seconds before proceeding to "win" room
if(m_hasWon2)
{
	m_winTimer++;
	if(m_winTimer >= room_speed*2)
	{
		audio_stop_sound(snd_steps);
		switch(global.level)
		{
			case 0:
				room_goto(rm_transition2);
				break;
			case 1:
				break;
		}
	}
}
