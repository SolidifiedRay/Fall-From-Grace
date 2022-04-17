/// @desc


/// @description Insert description here
// You can write your code in this editor
if (room == Level3 && place_meeting(x, y, obj_checkpoint)) {
	LEVEL3_CHECKPOINT = true;
}
// respawn
if (room == Level3 && LEVEL3_CHECKPOINT && respawn){
	x = obj_checkpoint.x;
	y = obj_checkpoint.y;
	respawn = false;
}


if (!dead) {

	// ============ Input Handling ============
	// check direction key pressed
	left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("K"));
	//dash = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("J"));
	phase = canphase && (keyboard_check(vk_shift) || keyboard_check(ord("J")));
	hook = keyboard_check(ord("Z")) || keyboard_check(ord("L"));
	hookdown = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("L"));
	
	noclip = keyboard_check(ord("T"));
	phase = phase || noclip;

	//Phase Mode
	if (phase) {
		in_phase = true;
		grounded /= 2;
	} else {
		if (not place_meeting(x,y, obj_wall)){
			in_phase = false;
		}
	}

	hvec = right - left;
	vvec = down - up;
	if (hvec == -1) facing = -1;
	if (hvec == 1) facing = 1;
	rotation = facing ? 45 : 135;

	// NOCLIP MODE (FOR DEBUGGING ONLY)
	if (noclip) {
		hsp = 0;
		vsp = 0;
		x += 16 * hvec;
		y += 16 * vvec;
	}

	// ============ Ground Checking ============
	if (place_meeting(x, y + 1, obj_wall) and not in_phase) grounded = 4;
	else grounded--;
	wall_jump_trail--;

	// ============ Cosmetics ============
	trailcolor = c_white;
	if (wall_jump_trail > 0) trailcolor = c_lime;
	if (in_phase) trailcolor = c_black;

	// ============ Player Movement ============

	// move speed
	vsp += grv;

	if (grounded > 0) {
		if (hvec == 0 || hvec == -sign(hsp) || abs(hsp) > walksp) {
			hsp -= sign(hsp) * walkdec;
			if (abs(hsp) < walkinc) hsp = 0;
		}
		if (abs(hsp + hvec * walkinc) < walksp) {
			hsp += hvec * walkinc;
		}
		// if (abs(hsp) > walksp) {
		// 	hsp = sign(hsp) * walksp;
		// }
	/*
		if (hvec == -1 && hsp + hvec * walkinc > hvec * walksp) {
			hsp += hvec * walkinc;
		} else if (hvec == 1 && hsp + hvec * walkinc < hvec * walksp) {
			hsp += hvec * walkinc;
		} else {
			hsp = abs(hsp) <= walkdec ? 0 : hsp - sign(hsp) * walkdec;
		}
		*/
	} else {
		if (wall_jump_trail > 0) {
			ainc = wjumpinc;
			adec = wjumpdec;
		} else if (instance_number(obj_grapplepoint) > 0) {
			ainc = hookinc;
			adec = hookdec;
		} else {
			ainc = airinc;
			adec = airdec;
		}

		if (hvec == 0 || hvec == -sign(hsp)) {
			hsp -= sign(hsp) * adec;
			if (abs(hsp) < ainc) hsp = 0;
		}
		if (abs(hsp + hvec * ainc) < airsp) {
			hsp += hvec * ainc;
		}
		//if (abs(hsp) > airsp) {
		//	hsp = sign(hsp) * airsp;
		//}
	/*
		if (hvec == -1 && hsp + hvec * airinc > hvec * airsp) {
			hsp += hvec * airinc;
		} else if (hvec == 1 && hsp + hvec * airinc < hvec * airsp) {
			hsp += hvec * airinc;
		} else {
			hsp = abs(hsp) <= airdec ? 0 : hsp - sign(hsp) * airdec;
		}
		*/
	}


	// handle wall sliding
	if (place_meeting(x + hsp, y, obj_wall)) && (!place_meeting(x, y + vsp, obj_wall)) {
		if (vsp > 0 && !in_phase) {
		vsp *= 0.75;
		}
		wall_slide_timer = 0;
		wall_slide_dir = sign(hsp)
		trailcolor = c_lime;
	}
	else {
		wall_slide_timer += 1;
	}

	in_wall_slide = (wall_slide_timer < 8);

	// jump

	if (!in_phase && ((grounded > 0) || (in_wall_slide)) && (jump)) {
	
		if (in_wall_slide) {
			hsp = -wjumphsp * wall_slide_dir;
			vsp = -wjumpvsp;
			wall_jump_trail = wall_jump_timer;
		}
		else {
			vsp = -jumpsp;
		}
		audio_play_sound(sfx_jump,0,0);
		grounded = 0;
	}

	if ((grounded < 0)  && can_double_jump && jump){
		can_double_jump = false;
	
		if (in_wall_slide) {
			hsp = -4.5 * wall_slide_dir;
			vsp = -jumpsp * 1.15;
			wall_jump_trail = 15;
		}
		else {
			vsp = -jumpsp;
		}
		audio_play_sound(sfx_jump,0,0);
		grounded = 0;
	}
	if (place_meeting(x,y, obj_double_jump)) {
		can_double_jump = true;
		double_jump_item = instance_place(x, y, obj_double_jump);
		instance_destroy(double_jump_item);
	}


	// grapple
	if (hookdown) {
		if (instance_number(obj_grapplehook) == 0 && instance_number(obj_grapplepoint) == 0) {
			proj = instance_create_layer(x, y, "instances", obj_grapplehook);
			proj.direction = facing ? 45 : 135;
			proj.image_angle = proj.direction;
		}
		audio_play_sound(sfx_shoot,0,0);
	}


	if (hook) {
		if (instance_number(obj_grapplepoint) > 0) {
			pointdir = point_direction(x, y, obj_grapplepoint.x, obj_grapplepoint.y);
			_hookgrv = hookgrv;
			//if (point_distance(x,y,obj_grapplepoint.x,obj_grapplepoint.y) > hooklen) {
				//x = obj_grapplepoint.x - lengthdir_x(hooklen, pointdir);
				//y = obj_grapplepoint.y - lengthdir_y(hooklen, pointdir);
				//_hookgrv *= 1.1;
			//}
			hsp += lengthdir_x(_hookgrv, pointdir);
			vsp += lengthdir_y(_hookgrv, pointdir);

			
			trailcolor = c_aqua;
		}
	} else {
		instance_destroy(obj_grapplehook);
		instance_destroy(obj_grapplepoint);
	}




	// dash
	/*
	if (dash && num_dash_left) {
		in_dash = true;
		num_dash_left = 0;
		grounded = 0;
		dash_timer = dash_length;
		hsp = lengthdir_x(dashsp, direction);
		vsp = lengthdir_y(dashsp, direction);
		show_debug_message(dashsp)
		old_facing = facing;
		audio_play_sound(sfx_dash,0,0);
	}

	if (in_dash) && (dash_timer > 0) {
		trailcolor = c_red;
		facing = 1;
		rotation = direction;
		hsp = lengthdir_x(dashsp, direction);
		vsp = lengthdir_y(dashsp, direction);
		dash_timer -= 1;
		if (dash_timer == 0) {
			in_dash = false;
			facing = old_facing;
			rotation = 0;
			hsp = lengthdir_x(dashsp, direction);
			vsp = lengthdir_y(dashsp, direction);
		}
	}

	if (grounded > 0) { // replenish dash num
		num_dash_left = 1;
	}
	*/

	// normalize speed
	sp = point_distance(0, 0, hsp, vsp);
	if (sp > maxsp) {
		scale = maxsp / sp;
		hsp *= scale;
		vsp *= scale;
	}


	// moving platform collision
	var _movingPlatform = instance_place(x, y + max(1, vsp), obj_moving_platform);
	if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top && !in_phase) {
		if (vsp > 0) {
			while (!place_meeting(x, y + sign(vsp), obj_moving_platform)){
				y += sign(vsp);
			}
			vsp = 0;
		}
		show_debug_message("in");
		// Add velocity
		x += _movingPlatform.hsp;
		y += _movingPlatform.vsp;
	}
	// side collision
	else if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_bottom && !in_phase) {
		// Add velocity
		grounded = 0;
		x += _movingPlatform.hsp;
	}


	// horizontal collision
	if (place_meeting(x + hsp, y, obj_wall) and not in_phase) {
		while (!place_meeting(x + sign(hsp), y, obj_wall)) {
			x += sign(hsp);
		}
		hsp = 0;

	}

	// vertical collision
	if (place_meeting(x, y + vsp, obj_wall) and not in_phase) {
		while (!place_meeting(x, y + sign(vsp), obj_wall)) {
			y += sign(vsp);
		}
		vsp = 0;
	}


	// diagonal collision
	// hopefully this will prevent players from being trapped in corners.
	if (place_meeting(x + hsp, y + vsp, obj_wall) and not in_phase) {
		while (!place_meeting(x + sign(hsp), y + sign(vsp), obj_wall)) {
			x += sign(hsp);
			y += sign(vsp);
		}
		hsp = 0;
		vsp = 0;
	}


	// Force the player to phase if the player is trapped in wall
	if (place_meeting(x, y, obj_wall)){
		in_phase = true;
	}


	// kill the player
	if (collision_line(x,y,x + hsp, y + vsp, obj_kill,0,0) && !dead && !winning)
	|| (position_meeting(x, y, obj_killBlock) && in_phase && !dead && !winning)
	|| (position_meeting(x, y, obj_spike) && !in_phase && !dead && !winning)
	{
		instance_create_layer(x,y,"instances",obj_death);
	}

	// win
	if (collision_line(x,y,x + hsp, y + vsp, obj_win,0,0) && !dead && !winning)
	{
		alarm[0] = 240;
		winning = true;
	}

	x += hsp;
	y += vsp;

	/*
	if (in_phase) {
		dir = random(360);
		length = random(8);
		star = instance_create_layer(x + lengthdir_x(length,dir),y+lengthdir_y(length,dir), "instances", obj_star);
		star.depth -= 10;
		if (instance_number(obj_grapplepoint) > 0)	star.image_blend = trailcolor;
		trailcolor = c_black;
		if (irandom(2) == 0) star.image_blend = c_yellow;
	
	}

	trail = instance_create_layer(x, y, "instances", obj_playertrail);
	trail.image_blend = trailcolor;
	trail.depth = in_phase ? 350 : depth + 1;
	*/
	//trail.image_angle = point_direction(0,0,hsp,vsp);
	if (sp <= 0) sp = 0.1;
	sp = 1; // comment this out for absurd trails
	for(i = 0; i < 1; i += 1 / sp) {
		if (in_phase) {
			dir = random(360);
			length = random(8);
			star = instance_create_layer(lerp(x-hsp,x,i) + lengthdir_x(length,dir),lerp(y-vsp,y,i)+lengthdir_y(length,dir), "instances", obj_star);
			star.depth -= 10;
			if (instance_number(obj_grapplepoint) > 0)	star.image_blend = trailcolor;
			trailcolor = c_black;
			if (irandom(2) == 0) star.image_blend = c_yellow;
		}
	
		trail = instance_create_layer(lerp(x-hsp,x,i),lerp(y-vsp,y,i), "instances", obj_playertrail);
		trail.image_blend = trailcolor;
		trail.depth = in_phase ? 250: depth + 1;	
	}



// =========================================
} else {
	x = spawnx;
	y = spawny;
}

if (winning) {
	firework = instance_create_layer(x+8*cos(alarm[0]), y-8*sin(alarm[0]),"instances",obj_poof);
	firework.image_blend = trailcolor;
} else {
	totalframes++;
}

frames = totalframes mod 60;
seconds = (totalframes div 60) mod 60;
minutes = (totalframes div 60) div 60;