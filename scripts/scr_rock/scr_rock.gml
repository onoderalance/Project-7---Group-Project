// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_objDirCheck(checkObj, omitObj)
{
	var dirList = ds_list_create();
	//left collision
	if(collision_line(x-16,y+sprite_height/2,x,y+sprite_height/2,checkObj,false,true) != noone) //collision box to left of calling obj
	{
		if(collision_line(x-16,y+sprite_height/2,x,y+sprite_height/2,checkObj,false,true).object_index != omitObj)
			ds_list_add(dirList,dir.left);
	}
	//right collision
	if(collision_line(x+sprite_width,y+sprite_height/2,x+sprite_width+15,y+sprite_height/2,checkObj,false,true) != noone)  //collision box to right of calling obj
	{
		if(collision_line(x+sprite_width,y+sprite_height/2,x+sprite_width+15,y+sprite_height/2,checkObj,false,true).object_index != omitObj)
			ds_list_add(dirList,dir.right);
	}
	//top collision
	if(collision_line(x+sprite_width/2,y-16,x+sprite_width/2,y,checkObj,false,true) != noone)  //collision box to right of calling obj
	{
		if(collision_line(x+sprite_width/2,y-16,x+sprite_width/2,y,checkObj,false,true).object_index != omitObj)
			ds_list_add(dirList,dir.up);
	}
	//below collision
	if(collision_line(x+sprite_width/2,y+sprite_height,x+sprite_width/2,y+sprite_height+15,checkObj,false,true) != noone)  //collision box to right of calling obj
	{
		if(collision_line(x+sprite_width/2,y+sprite_height,x+sprite_width/2,y+sprite_height+15,checkObj,false,true).object_index != omitObj)
			ds_list_add(dirList,dir.down);
	}
	//return any collisions
	return dirList;
	
}

function scr_pushInDir(pushDir)
{
	switch(pushDir)
	{
		case dir.left:
			m_targetX = x + sprite_width;
			break;
		case dir.right:
			m_targetX = x - sprite_width;
			break;
		case dir.up:
			m_targetY = y + sprite_height;
			break;
		case dir.down:
			m_targetY = y - sprite_height;
			break;
	}
}

//checks for potential obstructions on other side of rock object
function scr_checkObstruction(checkDir, list)
{
	show_debug_message(ds_list_size(list));
	show_debug_message(ds_list_find_value(list,0));
	//nothing in list, no potential issues
	if(ds_list_size(list) < 1)
		return true;
		
	//check opposite direction of checkdir (make sure nothing obstructs the other side
	switch(checkDir)
	{
		case dir.left:
			if(ds_list_find_index(list, dir.right) != -1)
				return false;
			break;
		case dir.right:
			if(ds_list_find_index(list, dir.left) != -1)
				return false;
			break;
		case dir.up:
			if(ds_list_find_index(list, dir.down) != -1)
				return false;
			break;
		case dir.down:
			if(ds_list_find_index(list, dir.up) != -1)
				return false;
			break;
	}
	//made it through checks, no issues
	return true;
}
