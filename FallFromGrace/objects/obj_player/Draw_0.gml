/// @description Insert description here
// You can write your code in this editor

// draw_sprite_ext( sprite_index, image_index, x, y, image_xscale, image_yscale, rotation, image_blend, image_alpha);
draw_set_alpha(1);
if (!dead) {
	draw_set_colour(c_black);
	if (in_phase) draw_set_colour(c_white);



	draw_circle(x,y,7,false);
	if(hookdown) {
		draw_set_colour(c_lime);
		draw_line_width(x,y,aimx,aimy,3);
	}
	
	if (instance_number(obj_grapplepoint) > 0) {
		draw_set_colour(c_aqua);
		draw_line_width(x,y,obj_grapplepoint.x,obj_grapplepoint.y,3);
	}

	if (instance_number(obj_grapplehook) > 0) {
		draw_set_colour(c_aqua);
		draw_line_width(x,y,obj_grapplehook.x,obj_grapplehook.y,2);
	}

	draw_set_colour(c_black);
	if (in_phase) draw_set_colour(c_white);
	if (instance_number(obj_grapplepoint) > 0) {
		draw_line_width(x,y,x+lengthdir_x(8,point_direction(x,y,obj_grapplepoint.x,obj_grapplepoint.y)),y+lengthdir_y(8,point_direction(x,y,obj_grapplepoint.x,obj_grapplepoint.y)),8);

	} else if (instance_number(obj_grapplehook) > 0) {
		draw_line_width(x,y,x+lengthdir_x(8,point_direction(x,y,obj_grapplehook.x,obj_grapplehook.y)),y+lengthdir_y(8,point_direction(x,y,obj_grapplehook.x,obj_grapplehook.y)),8);

	} else {
		/*
		draw_set_colour(c_black);
		if (in_phase) draw_set_colour(c_white);
		draw_line_width(x,y,x+lengthdir_x(1024,rotation),y+lengthdir_y(1024,rotation),2);
		draw_set_colour($3e4fb4);
		draw_line_width(x,y,x+lengthdir_x(1024,rotation),y+lengthdir_y(1024,rotation),1);
		*/
		
		aimlength = clamp(64,0, point_distance(x,y,aimx,aimy) / 2);
		draw_set_colour(c_black);
		if (in_phase) draw_set_colour(c_white);
		draw_line_width(aimx,aimy,aimx-lengthdir_x(aimlength,rotation),aimy-lengthdir_y(aimlength,rotation),2);
		//draw_set_colour($3e4fb4);
		if (aimtrue) draw_set_colour(c_aqua) else draw_set_colour(c_red);
		draw_line_width(aimx,aimy,aimx-lengthdir_x(aimlength,rotation),aimy-lengthdir_y(aimlength,rotation),1);
		
		draw_set_colour(c_black);
		if (in_phase) draw_set_colour(c_white);
		draw_line_width(x,y,x+lengthdir_x(8,rotation),y+lengthdir_y(8,rotation),8);
	}




	draw_set_colour(trailcolor);
	draw_circle(x,y,5,false);
	
	draw_sprite(aimsprite,0,aimx,aimy);
}
