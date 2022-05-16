/// @description Insert description here
// You can write your code in this editor


if(m_arrowTimer >= arrowDelay)
{
	var newArrow = instance_create_depth(x,y,depth-1,obj_arrow);
	newArrow.speed = arrowSpeed;
	newArrow.m_dir = shootDir;
	m_arrowTimer = 0;
}

m_arrowTimer++;
