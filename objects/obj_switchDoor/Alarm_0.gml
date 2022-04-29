/// @description Insert description here
// You can write your code in this editor

//plays door opening sound before destroying itself
audio_play_sound(snd_door,1000,false);

instance_destroy();