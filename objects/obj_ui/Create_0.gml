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

depth = -10000;

//variables for losing screen timer
m_hasLost = false;
m_loseTimer = 0;