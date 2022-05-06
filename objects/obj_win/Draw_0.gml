/// @description Insert description here
// You can write your code in this editor

//formats font to center itself
draw_set_color(c_black);
draw_set_font(fnt_big);
draw_set_halign(fa_center);
draw_text_transformed(x,y,"Level 1 Complete!",6,6,0)

//centers second line appropriately
draw_text_transformed(x,y+180,"Press Enter to continue to Level 2",5,5,0);
