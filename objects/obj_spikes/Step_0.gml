/// @description Insert description here
// You can write your code in this editor


//determines sprite shown (extended or retracted)
if(!m_spikesOut)
{
	if(m_spikeState > 0 && m_spikeTimer%2 == 0)
		m_spikeState--;
}
else
{
	if(m_spikeState < 2 && m_spikeTimer%2 == 0)
		m_spikeState++;
}

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

switch(global.level)
{
	case 0: //nothing for level 1, default sprites
		image_index = m_spikeState;
		break;
	case 1: //offset sprite index by 3
		image_index = m_spikeState + 3;
		break;
}



