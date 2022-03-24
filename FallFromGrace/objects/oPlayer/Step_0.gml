/// @desc Get Inputs
key_left = keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"));
key_right = keyboard_check_direct(vk_right) or keyboard_check_direct(ord("D"));
key_jump = keyboard_check_pressed(ord("W"));
key_kick = keyboard_check_pressed(ord("K"));
key_leap = keyboard_check_pressed(ord("L"));
key_phase = keyboard_check(vk_space);

//Calc horizontal movement
walljumpdelay = max(walljumpdelay-1,0);
if (walljumpdelay == 0)
{
	var dir = key_right - key_left;
	hsp += dir * hsp_acc;
	if (dir == 0) 
	{
		var hsp_fric_final = hsp_fric_ground;
		if (!onground) hsp_fric_final = hsp_fric_air;
		hsp = Approach(hsp,0,hsp_fric_final);
	}
	hsp = clamp(hsp,-hsp_walk,hsp_walk);
}

//Wall jump
if (onwall != 0) && (!onground) && (key_kick)
{
	walljumpdelay = walljumpdelay_max;
	
	hsp = -onwall * hsp_wjump;
	vsp = vsp_wjump;
	
	hsp_frac = 0;
	vsp_frac = 0;
	
	audio_play_sound(sndWallJump, 1, 0);
}

//Calc vertical movement
var grv_final = grv;
var vsp_max_final = vsp_max;
if (onwall != 0) && (vsp > 0)
{
	grv_final = grv_wall;
	vsp_max_final = vsp_max_wall;
}
vsp += grv_final;
vsp = clamp(vsp,-vsp_max_final,vsp_max_final);

//Ground Jump
if (jumpbuffer > 0)
{	
	jumpbuffer--;
	if ((key_jump and onground) or (key_leap and not onground))
	{	
		
		if (onground) {
			audio_play_sound(sndJump, 1, 0);
		}
		else {
			audio_play_sound(sndDoubleJump, 1, 0);
		}
		
		jump_spend++
		jumpbuffer = 0;
		vsp = vsp_jump;
		vsp_frac = 0;
			
	}
}
vsp = clamp(vsp,-vsp_max,vsp_max)

//Dump fractions and get final integer speeds
hsp += hsp_frac;
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac;

//Phase Mode
if (key_phase) {
	phase_mode = true;
	onground = false;
	onwall=0;
	audio_play_sound(sndPhase, 1, 0);
} else {
	if (not place_meeting(x,y, oWall)){
		phase_mode = false;
	}
}

var _hsp_final = hsp + hsp_carry;
hsp_carry = 0;

//Horizontal Collision
if (place_meeting(x+_hsp_final,y,oWall) and not phase_mode)
{
	var onepixel = sign(hsp);
	while (!place_meeting(x+onepixel,y,oWall)) x += onepixel;
	_hsp_final = 0;
	hsp = 0
	hsp_frac = 0;
}
//Horizontal Move
x += _hsp_final;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall) and not phase_mode)
{
	var onepixel = sign(vsp);
	while (!place_meeting(x,y+onepixel,oWall)) y += onepixel;
	vsp = 0;
	vsp_frac = 0;
}
y += vsp;

//Calc current status
onground = place_meeting(x,y+1,oWall) and not phase_mode; // true of false
onwall = place_meeting(x+1,y,oWall) - place_meeting(x-1,y,oWall); // 0 for false, 1 for right wall, -1 for left wall
if (onground or onwall) {jumpbuffer = 6; jump_spend=0; }
if (not onground and can_double_jump) jumpbuffer = 6;
if (jump_spend >= 2) can_double_jump = false;
if place_meeting(x, y, oDubleJump){
	can_double_jump = true;
	double_jump_item = instance_place(x, y, oDubleJump);
	instance_destroy(double_jump_item);
}

//Adjust sprite
image_speed = 1;
if (_hsp_final != 0) image_xscale = sign(_hsp_final);
if (!onground)
{
	if (onwall != 0)
	{
		sprite_index = sPlayer_wall;
		image_xscale = onwall;
		
		var side = bbox_left;
		if (onwall == 1) side = bbox_right;
		dust++;
		if ((dust > 2) && (vsp > 0)) with (instance_create_layer(side,bbox_top,"Behind",oDust))
		{
			other.dust = 0;
			hspeed = -other.onwall*0.5;
		}
	}
	else
	{
		dust = 0;
		if phase_mode or (not phase_mode and place_meeting(x, y, oWall)) {
			sprite_index = sPlayer_phase;
		} else {
			sprite_index = sPlayer_air;
		}
		image_speed = 0;
		image_index = (vsp > 0);
	}
} 
else 
{
	if (hsp != 0) {
		sprite_index = sPlayer_run;
	}
	else {
		sprite_index = sPlayer;
		if place_meeting(x, y, oWall){
			room_goto(room_end);
		}
	}
}

// Player die
if x < 0 or x > room_width or y < 0 or y > room_height {
	room_goto(room_end)
}

// Debug
if room == room2 and keyboard_check(ord("3")){
	x = 1280;
	y = 960;
}