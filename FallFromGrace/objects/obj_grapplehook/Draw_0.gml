/// @description Insert description here
// You can write your code in this editor
 
 if (obj_player.y != y and obj_player.x != x){ 
	draw_sprite_ext( sprite_index, image_index, x, y, image_xscale, image_yscale, point_direction(obj_player.x,obj_player.y,x,y), image_blend, image_alpha);
 }