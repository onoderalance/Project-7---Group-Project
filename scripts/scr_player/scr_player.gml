// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//movement functions based on Maddy Thorson's implementation, but returns object collided with if collision is detected
function scr_movex(amount)
{
	m_xremainder += amount; 
	var move = round(m_xremainder); 
	if (move != 0) 
	{ 
		m_xremainder -= move; 
		var movedir = sign(move); 
		while (move != 0)
		{
			var inst = instance_place(x + movedir, y, obj_solid)
			if (!inst || !inst.isSolid)
			{
				//There is no solid immediately beside us
				x += movedir; 
				move -= movedir; 
			} 
			else
			{ 
				//In a colision, return collided object
				return inst;
			} 
		} 
	}
	return noone;
}

function scr_movey(amount) 
{
	m_yremainder += amount; 
	var move = round(m_yremainder); 
	if (move != 0) 
	{ 
		m_yremainder -= move; 
		var movedir = sign(move); 
		while (move != 0) 
		{
			var inst = instance_place(x, y + movedir, obj_solid)
			if (!inst || !inst.isSolid)
			{
				//There is no solid immediately beside us
				y += movedir; 
				move -= movedir; 
			} 
			else
			{ 
				//In a colision, return collided object
				return inst;
			} 
		} 
	}
	return noone;
}

//damage timer check
function scr_damageTimer()
{
	if(m_damageTimer >= 0)
	{
		m_damageTimer++;
		if(m_damageTimer < 15)
			visible = false;
		else if(m_damageTimer < 30)
			visible = true
		else if(m_damageTimer < 45)
			visible = false;
		else if(m_damageTimer < 60)
			visible = true;
		else if(m_damageTimer < 75)
			visible = false;
		else if(m_damageTimer < 90)
			visible = true;
		else if(m_damageTimer < 105)
			visible = false;
		else if(m_damageTimer < 120)
			visible = true;
		else if(m_damageTimer > room_speed*2)
		{
			visible = true;
			m_damageTimer = -1;
			global.takingDamage = false;
		}
	}
}

//falling timer check
function scr_fallingTimer()
{
	if(m_falling >= 0)
	{
		m_falling++
		image_yscale *= .97;
		image_xscale *= .97;
		switch(m_playerDir)
		{
			case dir.up:
			case dir.right:
				image_angle -= 2;
				break;
			case dir.left:
			case dir.down:
				image_angle += 2;
				break;
		}

		if(m_falling > room_speed*2)
		{
			m_falling = -1;
			image_xscale = 1;
			image_yscale = 1;
			image_angle = 0;
		}
	}
}