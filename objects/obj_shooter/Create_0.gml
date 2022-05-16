/// @description Insert description here
// You can write your code in this editor

var shooterTop = instance_create_depth(x,y,depth-2,obj_shooterTop);


switch(shootDir)
{
	case 0:
		//shooterTop.x += 16;
		//shooterTop.y -= 16;
		break;
	case 1:
		shooterTop.image_angle = 90;
		break;
	case 2:
		shooterTop.image_angle = 180;
		break;
	case 3:
		shooterTop.image_angle = 270;
		break;
}

image_index = 2;

m_arrowTimer = 0;
