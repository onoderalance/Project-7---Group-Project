/// @description Insert description here
// You can write your code in this editor

//enum for tracking direction
enum dir
{
	null,
	up,
	down,
	right,
	left
}

//globals to track last position in the case of falling into a pit
global.lastX = 0;
global.lastY = 0;

//globals to track current zone (used for spike sound)
global.zoneX = 0;
global.zoneY = 0;

//variable tracking number of keys held
global.keyCount = 0;

//variables keeping track of if the player is controllable or taking damage
global.playingGame = true;
global.takingDamage = false;

//initial player direction
m_playerDir = dir.down;

//player speed
m_speed = 1;

//variables used by movement script
m_xmove = 0;
m_ymove = 0;
m_xremainder = 0;
m_yremainder = 0;

//variables to track and hold collided objects 
m_instSolid = noone;
m_currSolid = noone;

//variables to track last collided NPC/ID
m_currNPC = noone;
m_currNPCID = 0;

//timer to track when taking damage
m_damageTimer = -1;

//timer to track when player is falling
m_falling = -1;

//player starts idle, initializes image speed accordingly
image_speed = 0;