/// @description Insert description here
// You can write your code in this editor

//global gamestate, mainly used for tracking whether the big door has been opened
global.gameState = 0;	

//health stats
global.health = global.maxHealth;

//boolean array tracking which fragments have been collected
global.piece[0] = false;
global.piece[1] = false;
global.piece[2] = false;

global.bigKey = false;

//make initialization look cleaner
draw_set_color(c_black);
draw_set_font(fnt_big);

//globally set the level from UI object
global.level = level;

switch(level)
{
	//level 1, default sprite
	case 0:
		image_index = 0;
		break;
	case 1:
		image_index = 1;
		break;
}

depth = -10000;

//variables for losing screen timer
m_hasLost = false;
m_loseTimer = 0;