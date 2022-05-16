/// @description Insert description here
// You can write your code in this editor

if(!m_created)
{
	visible = true;
	switch(m_dir)
	{
		case 0: //right
			x -= 8;
			break;
		case 1: //up
			image_angle = 90;
			x -= 1;
			y += 8
			break;
		case 2: //left
			image_angle = 180;
			x += 8;
			break;
		case 3: //down
			image_angle = 270;
			x -= 1;
			y -= 8;
			break;
	}
	m_created = true;
	direction = image_angle;

}
else
{
	if(m_arrowSpawnImmunity > 8 && !m_broken)
		image_index = 1;
		
	if(place_meeting(x,y,obj_solid) && m_arrowSpawnImmunity > round(32/speed)+1)
	{
		m_broken = true;
		depth = -y;
	}

	m_arrowSpawnImmunity++;

	if(m_broken)
	{
		speed = 0;
		image_speed = 1;
		if(image_index >= 4)
			instance_destroy();
	}
}
