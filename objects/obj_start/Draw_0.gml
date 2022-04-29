/// @description Insert description here
// You can write your code in this editor

//formats font to center itself
draw_set_color(c_white);
draw_set_font(fnt_big);
draw_set_halign(fa_center);
draw_text_transformed(x,y,"Narrative Game Elaboration.",6,6,0)

//centers second line appropriately
draw_set_halign(fa_left);
draw_text_transformed(x-300,y+90,"Press 1 for easy\nPress 2 for normal\nPress 3 for hard",5,5,0);
