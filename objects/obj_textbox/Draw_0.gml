/// @description Insert description here
// You can write your code in this editor

//draws itself first
draw_self();

//text formating for clean print into the textbox
draw_set_font(fnt_small);
draw_set_halign(fa_left);
draw_text_ext(x+1,y+1,m_dialogueCurr,8,sprite_width-1)