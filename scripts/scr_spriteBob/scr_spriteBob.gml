// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//initializes sprite bobbing vars
function scr_spriteBobInit()
{
	m_bobTimer = 0;

	//state of bobbing sprite vertically, false is down, true is up
	m_bobState = true;

	//vars tracking where sprite is drawn
	m_bobX = x;
	m_bobY = y;
}

//handles sprite bobbing
//timing handles how often it bobs, distance how many pixels it bobs, and scale the lerp scale
function scr_spriteBob(index, timing, distance, scale)
{
	m_bobTimer++;

	if(m_bobTimer >= timing)
	{
		m_bobState = !m_bobState;
		m_bobTimer = 0;
	}

	if(m_bobState)
	{
		m_bobY = lerp(m_bobY, y-distance, scale)
	}
	else
	{
		m_bobY = lerp(m_bobY, y, scale)
	}

	draw_sprite(sprite_index,index,m_bobX,m_bobY);

}
