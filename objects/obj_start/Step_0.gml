/// @description Insert description here
// You can write your code in this editor

//starts main game room, initializing player max health depending on difficulty chosen
if(keyboard_check(ord("1")))
{
	global.maxHealth = 16;
	room_goto_next();
}
else if(keyboard_check(ord("2")))	
{
	global.maxHealth = 8;
	room_goto_next();
}
else if(keyboard_check(ord("3")))
{
	global.maxHealth = 1;
	room_goto_next();
}