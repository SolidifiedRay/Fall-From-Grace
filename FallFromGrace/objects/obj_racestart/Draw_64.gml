/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_rectangle(2,2+20,86,19+20,0);

draw_set_alpha(1);
draw_set_colour(c_yellow);
if (!started) draw_set_colour(c_aqua);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(Font1);
draw_text(4,5+20, string_replace_all(string_format(minutes,2,0), " ", "0") + 
           ":" + string_replace_all(string_format(seconds,2,0), " ", "0") +
           "+" + string_replace_all(string_format(frames,2,0), " ", "0"));

