/// @description Insert description here
// You can write your code in this editor

/*
m_keyTimer++;

if(m_keyTimer >= 60)
{
	m_keyState = !m_keyState;
	m_keyTimer = 0;
}

if(m_keyY > y-0.1)
	m_keyState = true;

if(m_keyY < y-4.9)
	m_keyState = false;

if(m_keyState)
{
	m_keyY = lerp(m_keyY, y-5, 0.05)
}
else
{
	m_keyY = lerp(m_keyY, y, 0.05)
}

draw_sprite(sprite_index,0,m_keyX,m_keyY);
*/

m_keyTimer++;

if(m_keyTimer >= 60)
{
	m_keyState = !m_keyState;
	m_keyTimer = 0;
}

if(m_keyState)
{
	m_keyY = lerp(m_keyY, y-2, 0.025)
}
else
{
	m_keyY = lerp(m_keyY, y, 0.025)
}

draw_sprite(sprite_index,0,m_keyX,m_keyY);


