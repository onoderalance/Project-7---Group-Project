/// @description Insert description here
// You can write your code in this editor

//formats font to center itself
draw_set_color(c_black);
draw_set_font(fnt_big);
draw_set_halign(fa_center);
draw_text_transformed(x,y,"You Won!",6,6,0)

//centers second line appropriately
draw_set_halign(fa_left);
draw_text_transformed(x-300,y+90,"Press Enter to restart\nPress Escape to exit",5,5,0);
