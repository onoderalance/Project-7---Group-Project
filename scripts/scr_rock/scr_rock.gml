// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_objDirCheck()
{
	var dirList = ds_list_create();
	//left collision
	if(collision_line(x-16,y+sprite_height/2,x,y+sprite_height/2,obj_player,false,false) != noone) //collision box to left of calling obj
	{
		ds_list_add(dirList,dir.left);
	}
	//right collision
	if(collision_line(x+sprite_width,y+sprite_height/2,x+sprite_width+16,y+sprite_height/2,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		ds_list_add(dirList,dir.right);
	}
	//top collision
	if(collision_line(x+sprite_width/2,y-16,x+sprite_width/2,y,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		ds_list_add(dirList,dir.up);
	}
	//below collision
	if(collision_line(x+sprite_width/2,y+sprite_height,x+sprite_width/2,y+sprite_height+16,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		ds_list_add(dirList,dir.down);
	}
	//return any collisions
	return dirList;
	/*
	//left collision
	if(collision_line(x-16,y+sprite_height/2,x,y+sprite_height/2,obj_player,false,false) != noone) //collision box to left of calling obj
	{
		return dir.left;
	}
	//right collision
	else if(collision_line(x+sprite_width,y+sprite_height/2,x+sprite_width+16,y+sprite_height/2,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.right;
	}
	//top collision
	else if(collision_line(x+sprite_width/2,y-16,x+sprite_width/2,y,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.up;
	}
	//below collision
	else if(collision_line(x+sprite_width/2,y+sprite_height,x+sprite_width/2,y+sprite_height+16,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.down;
	}
	//no collision detected
	return dir.null;
	*/
	/*
	//left collision
	if(collision_rectangle(x-16,x,y+sprite_height/2-1,y+sprite_height/2+1,obj_player,false,false) != noone) //collision box to left of calling obj
	{
		return dir.left;
	}
	//right collision
	else if(collision_rectangle(x+sprite_width,x+sprite_width+16,y+sprite_height/2-1,y+sprite_height/2+1,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.right;
	}
	//top collision
	else if(collision_rectangle(x+sprite_width/2-1,x+sprite_width/2+1,y-10,y,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.up;
	}
	//below collision
	else if(collision_rectangle(x+sprite_width/2-1,x+sprite_width/2+1,y+sprite_height,y+sprite_height+10,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.down;
	}
	//no collision detected
	return dir.null;
	*/
	/*
	//left collision
	if(collision_line(x-16,x,y+sprite_height/2,y+sprite_height/2,obj_player,false,false) != noone) //collision box to left of calling obj
	{
		return dir.left;
	}
	//right collision
	else if(collision_line(x+sprite_width,x+sprite_width+16,y+sprite_height/2,y+sprite_height/2,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.right;
	}
	//top collision
	else if(collision_line(x+sprite_width/2,x+sprite_width/2,y-16,y,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.up;
	}
	//below collision
	else if(collision_line(x+sprite_width/2,x+sprite_width/2,y+sprite_height,y+sprite_height+16,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.down;
	}
	//no collision detected
	return dir.null;
	*/
	/*
	//left collision
	if(collision_rectangle(x-10,x,y,y+10,obj_player,false,false) != noone) //collision box to left of calling obj
	{
		return dir.left;
	}
	//right collision
	else if(collision_rectangle(x+sprite_width,x+sprite_width+10,y,y+10,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.right;
	}
	//top collision
	else if(collision_rectangle(x,x+10,y-10,y,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.up;
	}
	//below collision
	else if(collision_rectangle(x,x+10,y+sprite_height,y+sprite_height+10,obj_player,false,false) != noone)  //collision box to right of calling obj
	{
		return dir.down;
	}
	//no collision detected
	return dir.null;
	*/
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
