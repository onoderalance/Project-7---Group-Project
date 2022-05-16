/// @description Insert description here
// You can write your code in this editor

//restricts player control input while transitioning between zones or falling
if(global.playingGame)
{
	//Stores movement values from input
	moveRight = keyboard_check(ord("D"));
	moveUp = keyboard_check(ord("W"));
	moveLeft = keyboard_check(ord("A"));
	moveDown = keyboard_check(ord("S"));
	
	//Calculates movement values based on input (mutiply speed by 1, 0, or -1 based on input )
	m_xmove = (moveRight - moveLeft) * m_speed;
	m_ymove = (moveDown - moveUp) * m_speed;
}

//Determines which direction the player is facing, overriding to most recently pressed key
if(keyboard_check_pressed(ord("D")))
	m_playerDir = dir.right;
else if(keyboard_check_pressed(ord("W")))
	m_playerDir = dir.up;
else if(keyboard_check_pressed(ord("A")))
	m_playerDir = dir.left;
else if(keyboard_check_pressed(ord("S")))
	m_playerDir = dir.down;

//case if only moving in one direction, use basic check 
//(revert to travel direction if no longer diagonal)
else if(m_xmove*m_ymove == 0)
{
	if(m_xmove > 0)
		m_playerDir = dir.right;
	else if(m_xmove < 0)
		m_playerDir = dir.left;

	if(m_ymove > 0)
		m_playerDir = dir.down;
	else if (m_ymove < 0)
		m_playerDir = dir.up;
}

//Determines which sprite to use
switch(m_playerDir)
{
	case dir.up:
		sprite_index = spr_playerUp;
		break;
	case dir.down:
		sprite_index = spr_playerDown;
		break;
	case dir.right:
		sprite_index = spr_playerRight;
		break;
	case dir.left:
		sprite_index = spr_playerLeft;
		break;
}

//determines sprite movement
if(m_xmove != 0 || m_ymove != 0)
	image_speed = 1;
else
{
	image_index = 0;
	image_speed = 0;
}

//Calls on collision checking movement scripts if any movement is being done
//Saves instance collided with to a variable that can be used later
if(m_ymove != 0)
{
	m_instSolid = scr_movey(m_ymove);
	m_currSolid = m_instSolid;
}
if(m_xmove != 0)
{
	m_instSolid = scr_movex(m_xmove);
	//checks if a collision exists on this axis or not, making sure to not override 
	//any returns from previous axis
	//only overrides current solid if there was no input/possible collision on other axis
	if(m_instSolid != noone || m_ymove == 0)
	{
		if(m_currSolid != noone) //prevent override on pits or areaMarkers
		{
			if(m_currSolid.object_index != obj_pit && m_currSolid.object_index != obj_areaMarker) 
				m_currSolid = m_instSolid;
		}	
		else
			m_currSolid = m_instSolid;
	}

}

//if colliding with a solid (solid is not null/noone), determines what to do with object
if(m_currSolid != noone)
{
	switch(m_currSolid.object_index)
	{
		//stores last NPC for dialogue interaction
		case obj_npc:
			m_currNPC = m_currSolid;
			show_debug_message("helpme");
			break;
		//opens doors if player has a small key for it
		case obj_door:
			if(global.keyCount > 0)
			{
				m_currSolid.alarm[0] = 1;
				global.keyCount--;
			}
			break;
		//opens big door if player has all key shards
		case obj_wideDoor:
			if(global.bigKey)
			{
				m_currSolid.alarm[0] = 1;
			}
			break;
		//destroys key and adds it to player key count
		case obj_key:
			m_currSolid.alarm[0] = 1;
			global.keyCount++;
			break;
		//destroys key fragment and tracks its posession
		case obj_bigkeyPiece:
			m_currSolid.alarm[0] = 1;
			global.piece[m_currSolid.keyID] = true;
			break;
		//moves to a new zone, pans camera with player to new zone
		case obj_areaMarker:
			var newDir = m_currSolid.side;

			//have the player move one tile over when changing rooms over the course of one second
			switch(m_currSolid.side)
			{
				case 0: //right
					m_xmove = tileSize/room_speed;
					m_ymove = 0;
					global.zoneX += 1;
					break;
				case 1: //up
					m_ymove = -tileSize/room_speed;
					m_xmove = 0;
					global.zoneY -= 1;
					break;
				case 2: //left
					m_xmove = -tileSize/room_speed;
					m_ymove = 0;
					global.zoneX -= 1;
					break;
				case 3: //down
					m_ymove = tileSize/room_speed;
					m_xmove = 0;
					global.zoneY += 1;
					break;
			}
			
			//pans camera while player is moving
			if(global.playingGame)
			{
				global.playingGame = false;
				with(global.cameraController)
					scr_pan(newDir);
			}
			break;
		//handles falling into a pit, playing sound and removing health. 
		case obj_pit:
			global.playingGame = false;
			audio_play_sound(snd_falling,1000,false);
			
			//retains momentum towards pit collided with (player sprite goes further into the pit)
			m_xmove = sign((m_currSolid.x) - x)*abs(m_xmove)/4;
			m_ymove = sign((m_currSolid.y) - y)*abs(m_ymove)/4;
			
			//triggers falling timer for falling animation
			m_falling = 0;
			
			//triggers reset of falling animation and behavior
			alarm[1] = room_speed*2;
			global.health -= 1;
			break;
		//handles colliding with rocks, rock behavior handled in rock obj itself
		case obj_rock:
			show_debug_message("pushing rock");
			m_currSolid.alarm[1] = 1;
			break;
	}
	//reset to noone incase most recent solid was deleted to avoid crashes
	m_currSolid = noone;
}

//handles hitting spikes separately (no longer treated as solid)
var spikes = instance_place(x,y,obj_spikes)
if(spikes)
{
	//removes spike collision when spikes are retracted, or when player has already taken damage
	//from spikes
	if(!global.takingDamage && spikes.m_spikesOut)
	{
		//handles colliding with spikes, playing sound and removing health.
		audio_play_sound(snd_hurt,1000,false);
			
		//triggers damage timer, ensuring player wont take multiple instances of damage repeatedly
		m_damageTimer = 0;
			
		global.health -= 2;
		global.takingDamage = true;
	}
}
//handles hitting arrows separately
var arrows = instance_place(x,y,obj_arrow)
if(arrows)
{
	if(!global.takingDamage && arrows.image_index < 2)
	{
		audio_play_sound(snd_hurt,1000,false);
			
		//triggers damage timer, ensuring player wont take multiple instances of damage repeatedly
		m_damageTimer = 0;
			
		global.health -= 2;
		global.takingDamage = true;
	}
}

//checks timers for taking damage and falling
scr_damageTimer();
scr_fallingTimer();
	
//npc dialogue handling
if(m_currNPC != noone)
{
	m_currNPCID = m_currNPC.npcID;
	//hides textbox once player has moved out of interactable range of the NPC
	if(!collision_rectangle(m_currNPC.x-m_currNPC.sprite_width,m_currNPC.y-m_currNPC.sprite_height*2,
		m_currNPC.x+m_currNPC.sprite_width,m_currNPC.y+m_currNPC.sprite_height,
		obj_player,false,false))
	{ 
		//resets last interacted NPC after leaving range
		m_currNPC = noone;
		m_currNPCID = 0;
		
		global.textBox.m_dialogueDirection = 0;
	}
	
	//dialogue interaction, only occurs on initial key press, and only goes for existing npcs (not 0)
	if(keyboard_check_pressed(vk_space) && m_currNPCID != 0)
	{
		//plays dialogue sound
		audio_play_sound(snd_dialogue,1000,false);
		
		with(global.textBox)
		{
			m_dialogueCurr = m_dialogueArray[obj_player.m_currNPCID][global.gameState];
			m_dialogueDirection = 1;
		}
	}
}

//depth sorting
depth = -y;

 