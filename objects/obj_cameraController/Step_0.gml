/// @description Insert description here
// You can write your code in this editor

//handles actually moving the camera based on values called in script called from player
//collision
if(m_movementTimer >= 0)
{
	x += m_xmove;
	y += m_ymove;
	m_movementTimer++;
	if(m_movementTimer = 60)
	{
		global.playingGame = true;
		m_movementTimer = -1;
	}
}

//move camera to cameraController's location, offset to make room for ui at top
camera_set_view_pos(view_camera[0],x,y-16);


//curtain behavior
if(m_curtainTimer > -1)
{
	if(m_curtainTimer%5 == 0 && m_curtainTimer >= 30)
		m_curtainState++;
	
	m_curtainTimer++;
	
	if(m_curtainTimer >= 120)
		m_curtainTimer = -1;
}

