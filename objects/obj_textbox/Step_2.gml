/// @description Insert description here
// You can write your code in this editor

//moves camera down or up depending on input
switch(m_dialogueDirection)
{
	case 0:
		if(m_Yoffset > -32)
			m_Yoffset -= m_dialogueMove;
		break;
	case 1:
		if(m_Yoffset < 0)
			m_Yoffset += m_dialogueMove;
		break;
}

x = camera_get_view_x(view_camera[0]) + 32;
y = camera_get_view_y(view_camera[0]) + m_Yoffset;

