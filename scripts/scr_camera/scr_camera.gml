// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//calculates required movement to the new room
function scr_pan(newDir){
	m_xmove = 0;
	m_ymove = 0;
	switch(newDir)
	{
		case 0:
			m_xmove = roomWidth/room_speed;
			break;
		case 1:
			m_ymove = -roomHeight/room_speed;
			break;
		case 2:
			m_xmove = -roomWidth/room_speed;
			break;
		case 3:
			m_ymove = roomHeight/room_speed;
			break;
	}
	m_movementTimer = 0;
}