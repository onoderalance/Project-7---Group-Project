/// @description collided with by player

if(!m_rockMoving)
{
	//stores rock push direction 
	m_rockDir = scr_objDirCheck();

	//only push if player is in a location which it can push from
	if(m_rockDir != dir.null)
	{
		m_rockMoving = true;
		scr_pushInDir(m_rockDir);
	}
}
	
