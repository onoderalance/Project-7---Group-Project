/// @description Insert description here
// You can write your code in this editor

//stores direction rock will be pushed
m_rockDir = dir.null;
//list for storing potential player directions
m_playerDirList = noone;
//list for storing potential obstructions
m_objDirList = noone;
//tracks whether rock is being currently pushed
m_rockMoving = false;

m_targetX = x;
m_targetY = y;

/*rock still needs 
	- handling switches
	- handling pits
	- handling respawning on room entry
	- particles when pushing
	- sounds for pushing AND for unsuccessful push
	- improved collision checking, perhaps large 16x16 square checks rather
	than just the single protruding line check
*/

