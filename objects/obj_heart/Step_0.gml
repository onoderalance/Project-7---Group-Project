/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x,y,obj_player) && m_heartTimer < -1)
{
	if(global.health >= global.maxHealth)
		audio_play_sound(snd_collect,1000,false);
	m_heartTimer = 0;
	visible = false;
} 

if(m_heartTimer > -1)
{
	if(m_heartTimer%5==0 && global.health < global.maxHealth)
	{
		audio_play_sound(snd_heart,1000,false);
		global.health++;
	}
	//should iterate health++ a max of two times
	if(m_heartTimer >= 9)
	{
		m_heartTimer = -1;
		alarm[0] = 1;
	}
	m_heartTimer++;
}


//basic depth sorting/ z-sorting
depth = -y;
