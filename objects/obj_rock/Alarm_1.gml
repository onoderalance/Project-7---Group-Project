/// @description collided with by player

if(!m_rockMoving)
{
	//stores rock push direction 
	m_playerDirList = ds_list_create();
	scr_objDirCheck(m_playerDirList, obj_player);
	
	//only one direction at a time to push the rock
	if(ds_list_size(m_playerDirList) == 1)
	{
		m_rockDir = ds_list_find_value(m_playerDirList,0);
	}
	else
		m_rockDir = dir.null;
		
	//only push if player is in a location which it can push from
	if(m_rockDir != dir.null)
	{
		show_debug_message("attempting push");
		m_objDirList = ds_list_create();
		//add solids to obstruction list
		scr_objDirCheck(m_objDirList, obj_solid)
		//add block collisions to obstruction list
		scr_objDirCheck(m_objDirList, obj_blockObst)
		if(scr_checkObstruction(m_rockDir, m_objDirList))
		{
			show_debug_message("no obst");
			m_rockMoving = true;
			scr_pushInDir(m_rockDir);
		}
		else
		{
			show_debug_message("obst");
			//idk maybe play a failure osund here to show that object couldnt be pushed
		}
	}
}
	
