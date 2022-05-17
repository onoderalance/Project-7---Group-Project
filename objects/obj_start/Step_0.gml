/// @description Insert description here
// You can write your code in this editor

//starts main game room, initializes to 6 hearts (no more difficulty select)
if(keyboard_check_pressed(vk_enter))
{
	global.maxHealth = 6;
	room_goto(rm_cutscene_1);
}
