/// @description Insert description here
// You can write your code in this editor

m_keyTimer++;

if(m_keyTimer >= 30)
{
	m_keyState = !m_keyState;
	m_keyTimer = 0;
}

if(m_keyState)
{
	m_keyY = lerp(m_keyY, y-2, 0.05)
}
else
{
	m_keyY = lerp(m_keyY, y, 0.05)
}

draw_sprite(sprite_index,0,m_keyX,m_keyY);

