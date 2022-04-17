/// @description Insert description here
// You can write your code in this editor

// draw_sprite_ext( sprite_index, image_index, x, y, image_xscale, image_yscale, rotation, image_blend, image_alpha);
draw_set_alpha(1);

draw_primitive_begin(pr_trianglestrip);
for (i = 0; i < tlen; i++) {
	tcnow = (i + 1 + tcounter + tlen) mod tlen;
	tclast = (tcnow - 1 + tlen) mod tlen;
	show_debug_message(tcnow);
	tdir = point_direction(tx[tclast],ty[tclast],tx[tcnow],ty[tcnow]);
	twid = 7;
	twid *= i / tlen;
	
	alpha1 = talpha[tcnow];
	// alpha1 *= i / tlen;
	
	color1 = tcolor[tcnow];
	x1 = tx[tcnow];
	y1 = ty[tcnow];
	
	x11 = x1+lengthdir_x(twid,tdir+90);
	y11 = y1+lengthdir_y(twid,tdir+90);
	x12 = x1+lengthdir_x(twid,tdir-90);
	y12 = y1+lengthdir_y(twid,tdir-90);
	

	draw_vertex_colour(x11, y11,color1,alpha1);
	draw_vertex_colour(x12, y12,color1,alpha1);
		
	//draw_circle(x11,y11,2,1);
	//draw_circle(x12,y12,2,1);

}
draw_primitive_end();

if (!dead) {
	draw_set_colour(c_black);
	if (in_phase) draw_set_colour(c_white);

	draw_circle(x,y,7,false);
	
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
		draw_set_colour($3e4ffb4);
		draw_line_width(x,y,x+lengthdir_x(1024,rotation),y+lengthdir_y(1024,rotation),1);
		*/
		
		//aimlength = clamp(64,0, point_distance(x,y,aimx,aimy) / 2);
		
		thinness = 2;
		thickness = 3;
		
		aimlength = point_distance(x,y,aimx,aimy) / 4;
		draw_set_colour(c_black);
		if (in_phase) draw_set_colour(c_white);
		draw_line_width(aimx,aimy,aimx-lengthdir_x(aimlength,rotation),aimy-lengthdir_y(aimlength,rotation),thickness);
		draw_line_width(x,y,x+lengthdir_x(aimlength,rotation),y+lengthdir_y(aimlength,rotation),thickness);
		aimlength--;
		//draw_set_colour($3e4fb4);
		if (aimtrue) draw_set_colour(c_aqua) else draw_set_colour(c_red);
		draw_line_width(aimx,aimy,aimx-lengthdir_x(aimlength,rotation),aimy-lengthdir_y(aimlength,rotation),thinness);
		draw_line_width(x,y,x+lengthdir_x(aimlength,rotation),y+lengthdir_y(aimlength,rotation),thinness);
		
		if (aimtrue) {
			midx = (x+aimx)/2;
			midy = (y+aimy)/2;
			aimlength/=2;
			draw_set_colour(c_black);
			if (in_phase) draw_set_colour(c_white);
			draw_line_width(midx,midy,midx-lengthdir_x(aimlength,rotation),midy-lengthdir_y(aimlength,rotation),thickness);
			draw_line_width(midx,midy,midx+lengthdir_x(aimlength,rotation),midy+lengthdir_y(aimlength,rotation),thickness);
			draw_set_colour(c_aqua);
			aimlength--;
			draw_line_width(midx,midy,midx-lengthdir_x(aimlength,rotation),midy-lengthdir_y(aimlength,rotation),thinness);
			draw_line_width(midx,midy,midx+lengthdir_x(aimlength,rotation),midy+lengthdir_y(aimlength,rotation),thinness);
		}
		
			
		if(hookdown) {
			draw_set_colour(c_lime);
			draw_line_width(x,y,aimx,aimy,3);
		}
		
		draw_set_colour(c_black);
		if (in_phase) draw_set_colour(c_white);
		draw_line_width(x,y,x+lengthdir_x(8,rotation),y+lengthdir_y(8,rotation),8);
	}

	draw_set_colour(trailcolor);
	draw_circle(x,y,5,false);


	
	//draw_sprite(aimsprite,0,aimx,aimy);
	if (aimtrue) {
		color1 = c_aqua;
		color2 = c_white;
		
		// draw_circle(aimx,aimy,point_distance(x,y,aimx,aimy)/2,1);
		draw_set_alpha(0.3);
		draw_set_colour(c_white);
		draw_circle(aimx,aimy,hooklen,1);
		draw_set_alpha(1);
		
	} else {
		color1 = c_red;
		color2 = c_black;
	}
	draw_set_colour(color1);
	draw_circle(aimx,aimy,4,0);
	draw_set_colour(color2);
	draw_circle(aimx,aimy,3,0);
	draw_set_colour(color1);
	draw_circle(aimx,aimy,2,0);

}
