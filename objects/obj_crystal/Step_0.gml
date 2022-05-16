/// @description Insert description here
// You can write your code in this editor

//plays sounds and returns to "title" screen upon contact with player
if(place_meeting(x,y,obj_player) && !m_pickedCrystal)
{
	audio_play_sound(snd_crystal,1000,false);
	//add one max heart?
	global.maxHealth += 2;
	m_pickedCrystal = true;
	visible = false;
} 

//waits 2 seconds before proceeding to "win" room
if(m_pickedCrystal)
{
	if(m_pickedCrystal%5==0 && global.health < global.maxHealth)
	{
		//audio_play_sound(snd_heart,1000,false);
		global.health++;
	}
	m_pickedCrystal++;
	if(m_pickedCrystal >= room_speed*2)
		instance_destroy();
}


