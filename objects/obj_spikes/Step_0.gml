/// @description Insert description here
// You can write your code in this editor

//removes spike collision when spikes are retracted, or when player has already taken damage
//from spikes
isSolid = true;
if(global.takingDamage || !m_spikesOut)
	isSolid = false;

//determines sprite shown (extended or retracted)
if(!m_spikesOut)
	image_index = 0;
else
	image_index = 1;

//every second plays sound and reverses whether spikes are extended or not
if(m_spikeTimer >= room_speed)
{
	//only plays sound if player is in the same zone as the spike object
	if(global.zoneX == zoneX && global.zoneY == zoneY)
		audio_play_sound(snd_spikes,1000,false);
	m_spikesOut = !m_spikesOut;
	m_spikeTimer = 0;
}
m_spikeTimer++;
	
