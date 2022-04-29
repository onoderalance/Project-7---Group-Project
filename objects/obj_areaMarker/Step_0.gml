/// @description Insert description here
// You can write your code in this editor

//removes collision while player control is removed (when moving between zones)
isSolid = true;
if(!global.playingGame)
	isSolid = false;
