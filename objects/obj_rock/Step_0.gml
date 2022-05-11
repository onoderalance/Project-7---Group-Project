/// @description Insert description here
// You can write your code in this editor

if(m_rockSet)
	image_index = 1;

if(m_rockMoving)
{
	//adjust along x	
	if(abs(x - m_targetX) > 1)
		x = lerp(x, m_targetX, 0.1);
	else
		x = m_targetX;
	//adjust along y
	if(abs(y - m_targetY) > 1)
		y = lerp(y, m_targetY, 0.1);
	else
		y = m_targetY;

		
	//if rock is in position, stop moving
	if(m_targetX == x && m_targetY == y)
	{
		m_rockMoving = false;
		show_debug_message("rock in place");
	}

}

//basic depth sorting/ z-sorting
depth = -y;
