/// @description Insert description here
// You can write your code in this editor

//bigKey collected once all shards have been found
if(global.piece[0] && global.piece[1] && global.piece[2])
{
	global.bigKey = true;
	global.gameState = 1;
}

//if player has 0 hearts left, triggers the losing timer to allow for delay before proceeding to lose screen
if(global.health <= 0 && !m_hasLost)
{
	global.playingGame = false;
	audio_stop_sound(snd_background);
	audio_play_sound(snd_lose,1000,false);
	obj_screenFade.alarm[0] = 1;
	m_hasLost = true;
}	

//timer to delay lose screen
if(m_hasLost)
{
	m_loseTimer++
	if(m_loseTimer >= room_speed*2)
		room_goto(rm_lose);
}