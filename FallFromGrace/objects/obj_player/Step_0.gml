if (room == Level3 && place_meeting(x, y, obj_checkpoint)) {
	LEVEL3_CHECKPOINT = true;
}
// respawn
if (room == Level3 && LEVEL3_CHECKPOINT && respawn) {
	x = obj_checkpoint.x;
	y = obj_checkpoint.y;
	respawn = false;
}

if (!dead) {

	// ============ Input Handling ============
	// check direction key pressed
	left = keyboard_check(global.left_key);
	right = keyboard_check(global.right_key);
	up = keyboard_check(global.up_key);
	down = keyboard_check(global.down_key) ;
	jump = (keyboard_check_pressed(global.jump_key)) ? 5 : jump - 1;
	jumprelease = !keyboard_check(global.jump_key);
	//dash = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("J"));
	phase = canphase && keyboard_check(global.phase_key);
	hook = keyboard_check(global.hook_key);
	hookdown = keyboard_check_pressed(global.hook_key);

	noclip = keyboard_check(ord("T"));
	phase = phase || noclip;
	phase = phase || (instance_number(obj_boss) && !obj_boss.dead);
	
	if left {
		spr_dir = -1;
	}
	if right {
		spr_dir = 1;
	}
	
	if (left || right) {
		spr_run_index += 0.5;
		if (spr_run_index > 5){
			spr_run_index = 0;
		}
	}

	//Phase Mode
	if (phase) {
		in_phase = true;
		grounded /= 2;
	} else {
		if (not place_meeting(x, y, obj_wall)) {
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
	if (place_meeting(x, y + 1, obj_wall) and not in_phase) {
		grounded = 4;
		wall_slide_timer = 8;
	}
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

		if (!instance_number(obj_grapplepoint) > 0) {
			if (hvec == 0 || hvec == -sign(hsp)) {
				hsp -= sign(hsp) * adec;
				if (abs(hsp) < ainc) hsp = 0;
			}
			if (abs(hsp + hvec * ainc) < airsp) {
				hsp += hvec * ainc;
			}
		} else {
			if (hvec == 0 || hvec == -sign(hsp)) {
				hsp -= sign(hsp) * adec;
				if (abs(hsp) < ainc) hsp = 0;
			}
			spd = point_distance(0,0,hsp,vsp);
			dir = point_direction(0,0,hvec,vvec);
			if (abs(hsp + lengthdir_x(ainc,dir) < airsp)) {
				hsp += lengthdir_x(ainc,dir);
			}
			if (abs(vsp + lengthdir_y(ainc,dir) < airsp)) {
				vsp += lengthdir_y(ainc,dir);
			}
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
		wall_slide_dir = sign(hsp);
		trailcolor = c_lime;
	} else if (place_meeting(x + 1, y, obj_wall)) && (!place_meeting(x, y + vsp, obj_wall)) {
		wall_slide_timer = 0;
		wall_slide_dir = 1;
	} else if (place_meeting(x - 1, y, obj_wall)) && (!place_meeting(x, y + vsp, obj_wall)) {
		wall_slide_timer = 0;
		wall_slide_dir = -1;
	} else {
		wall_slide_timer += 1;
	}

	in_wall_slide = (wall_slide_timer < 8);
	if (in_wall_slide && wall_slide_timer < 2 && !in_phase) {
		hsp *= 0.5;
	}

	// jump

	if (!in_phase && ((grounded > 0) || (in_wall_slide)) && (jump)) {
		if(in_wall_slide){
			spr_dir *= -1;
		}
		if (in_wall_slide) {
			hsp = -wjumphsp * wall_slide_dir;
			vsp = -wjumpvsp;
			wall_jump_trail = wall_jump_timer;
			wall_slide_timer = 8;
		} else {
			vsp = -jumpsp;
		}
		jump = false;
		jumped = true;
		audio_play_sound(sfx_jump, 0, 0);
		grounded = 0;
	}

	if ((grounded < 0)  && can_double_jump && jump) {
		can_double_jump = false;

		if (in_wall_slide) {
			hsp = -4.5 * wall_slide_dir;
			vsp = -jumpsp * 1.15;
			wall_jump_trail = 15;
		} else {
			vsp = -jumpsp;
		}
		audio_play_sound(sfx_jump, 0, 0);
		grounded = 0;
	}
	if (place_meeting(x, y, obj_double_jump)) {
		can_double_jump = true;
		double_jump_item = instance_place(x, y, obj_double_jump);
		instance_destroy(double_jump_item);
	}


	// grapple


	if (instance_number(obj_grapplepoint) <= 0) {
		aimx = x;
		aimy = y;
		aimtrue = false;
		
		gaps = 8;
		
		if (!position_meeting(x, y, obj_wall)) {
			while (!position_meeting(aimx, aimy, obj_wall)
					&& !(aimx < 0 || aimy < 0 || aimx > room_width || aimy > room_height)) {
				aimy-= gaps;
				aimx += gaps * facing;
			}
			while (position_meeting(aimx, aimy, obj_wall)) {
				aimy++;
				aimx-=facing;
			}
		
		}
		aimy--;
		aimx+=facing;
		var _list = ds_list_create();
		var _num = instance_place_list(aimx, aimy, obj_wall, _list, true);
		if _num > 0
		{
			for (var i = 0; i < _num; ++i;)
			{
			    wall = _list[| i];
				if (wall.object_index == obj_wall) || (wall.object_index == obj_moving_grapple) {
					aimtrue = true;
				}
			}
		}

		ds_list_destroy(_list);
	}
	// aimsprite = aimtrue ? spr_aimtrue : spr_aimfalse;

	if (hookdown) {
		/*
		if (instance_number(obj_grapplehook) == 0 && instance_number(obj_grapplepoint) == 0) {
			proj = instance_create_layer(x, y, "instances", obj_grapplehook);
			proj.direction = facing ? 45 : 135;
			proj.image_angle = proj.direction;
		}
		*/
		if (aimtrue) {
			instance_create_layer(aimx, aimy, "instances", obj_grapplepoint);
		} else {
			audio_play_sound(sfx_dink, 0, 0);
			 instance_create_layer(aimx,aimy,"instances",obj_poof);
		}
		audio_play_sound(sfx_shoot, 0, 0);
	}

	if (hook) {
		if (instance_number(obj_grapplepoint) > 0) {
			pointdir = point_direction(x, y, obj_grapplepoint.x, obj_grapplepoint.y);
			_hookgrv = hookgrv;
			jumped = false;
			if (circlehook) {
				if (point_distance(x,y,obj_grapplepoint.x,obj_grapplepoint.y) > hooklen) {
					x = obj_grapplepoint.x - lengthdir_x(hooklen, pointdir);
					y = obj_grapplepoint.y - lengthdir_y(hooklen, pointdir);
					spd = point_distance(0,0,hsp,vsp);
					currangle = point_direction(aimx,aimy,x,y);
					nextangle = point_direction(aimx,aimy,x+hsp,y+vsp);
					anglediff = dsin(nextangle-currangle);
					if (anglediff > 0) {
						nextangle = currangle + 90;
					} else if (anglediff < 0) {
						nextangle = currangle - 90;
					}
					hsp = lengthdir_x(spd, nextangle);
					vsp = lengthdir_y(spd, nextangle);
					//_hookgrv *= 1.1;
				}
			}
			hsp += lengthdir_x(_hookgrv, pointdir);
			vsp += lengthdir_y(_hookgrv, pointdir);


			trailcolor = c_aqua;
		}
	} else {
		instance_destroy(obj_grapplehook);
		instance_destroy(obj_grapplepoint);
		hooklen = point_distance(x,y,aimx,aimy);
	}

	if (instance_number(obj_grapplepoint) <= 0 && jumprelease && vsp < 0 && jumped) {
		vsp /= 2;
		jumped = false;
	}

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
			while (!place_meeting(x, y + sign(vsp), obj_moving_platform)) {
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
	if (place_meeting(x, y, obj_wall)) {
		in_phase = true;
	}


	// kill the player
	if (collision_line(x, y, x + hsp, y + vsp, obj_kill, 0, 0) && !dead && !winning)
		|| (position_meeting(x, y, obj_killBlock) && in_phase && !dead && !winning)
		|| (position_meeting(x, y, obj_spike) && !in_phase && !dead && !winning) {
		instance_create_layer(x, y, "instances", obj_death);
	}
	var nograv = instance_position(x + hsp, y + vsp, obj_nograv);
	if (nograv != noone) {

			vsp -= ((y - nograv.bbox_top) / nograv.sprite_height) * 2;
			vsp *= 0.95;
		
	}
	// win
	if (collision_line(x, y, x + hsp, y + vsp, obj_win, 0, 0) && !dead && !winning) {
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
	/*
	if (sp <= 0) sp = 0.1;
	sp = 1; // comment this out for absurd trails
	for (i = 0; i < 1; i += 1 / sp) {
		if (in_phase) {
			dir = random(360);
			length = random(8);
			star = instance_create_layer(lerp(x - hsp, x, i) + lengthdir_x(length, dir), lerp(y - vsp, y, i) + lengthdir_y(length, dir), "instances", obj_star);
			star.depth -= 10;
			if (instance_number(obj_grapplepoint) > 0)	star.image_blend = trailcolor;
			trailcolor = c_black;
			if (irandom(2) == 0) star.image_blend = c_yellow;
		}

		trail = instance_create_layer(lerp(x - hsp, x, i), lerp(y - vsp, y, i), "instances", obj_playertrail);
		trail.image_blend = trailcolor;
		trail.depth = in_phase ? 250 : depth + 1;
	}
	*/
	if (in_phase) {
		dir = random(360);
		length = random(8);
		star = instance_create_layer(x+lengthdir_x(length, dir), y+lengthdir_y(length, dir), "instances", obj_star);
		star.depth = -999;
		if (instance_number(obj_grapplepoint) > 0)	star.image_blend = trailcolor;
		trailcolor = instance_number(obj_grapplepoint) > 0 ? 1 : c_black;
		trailalpha = 1 ;
		if (irandom(2) == 0) star.image_blend = c_yellow;
	} else {
		trailalpha = 1;
	}
	
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, obj_racecheckpoint, _list, false);

	if _num > 0
	{
		var maxchecknum = checknum - 1;
		show_debug_message(maxchecknum);
	    for (var i = 0; i < _num; ++i;)
	    {
			rcp = _list[| i];
			
			if (abs(checknum - rcp.checknum) <= 1) {
				if (rcp.checknum > maxchecknum) maxchecknum = rcp.checknum;
				checknum = maxchecknum;
			}
	    }
		
	}

	ds_list_destroy(_list);




// =========================================
} else {
	x = lerp(x, spawnx, 0.055);
	y = lerp(y, spawny, 0.055);
	trailalpha = 0.5;
	// talpha[tcounter]=0;
	trailcolor = c_red;
}
ttimer++;
if (ttimer >= tgaps) {
	ttimer -= tgaps;
	tx[tcounter] = x;
	ty[tcounter] = y;
	tcolor[tcounter] = trailcolor;
	talpha[tcounter] = trailalpha;
	tcounter++;
	tcounter = tcounter mod tlen;
}


	


if (winning) {
	firework = instance_create_layer(x + 8 * cos(alarm[0]), y - 8 * sin(alarm[0]), "instances", obj_poof);
	firework.image_blend = trailcolor;
} else {
	totalframes++;
}

subs = instance_position(x,y,obj_subtitle);
if (subs != noone) {
	textsubs = subs.text;
	textcolor = subs.color;
} else {
	textsubs = "";
}
spd = point_distance(0,0,hsp,vsp);
frames = totalframes mod 60;
seconds = (totalframes div 60) mod 60;
minutes = (totalframes div 60) div 60;
