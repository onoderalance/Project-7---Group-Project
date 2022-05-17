if(is_fading == true){
	image_alpha += 0.02;
}

end_loop++;

if(end_loop >= room_speed*6)
	room_goto(rm_reset);
