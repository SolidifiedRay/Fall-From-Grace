mask_index = sMoveWall;

hsp = dir * movespeed;

//Horizontal Collision
/*if (place_meeting(x+hsp,y,oWall))
{
	var onepixel = sign(hsp);
	while (!place_meeting(x+onepixel,y,oWall)) x += onepixel;
	hsp = 0;
	dir *= -1;
}
*/

if x > 700 and x < 750 {
	dir = 1;
}

if x > 1200 and x < 1250 {
	dir = -1;
}

//Horizontal Move
x += hsp;

/*
show_debug_message(string(place_meeting(x,y-1,oPlayer)));

if (instance_exists(oPlayer)) {
	if ((oPlayer.y + (oPlayer.sprite_height/2) < y) || (oPlayer.phase_mode)) {
		show_debug_message("above");
		
	}
	else if (place_meeting(x,y-1,oPlayer)) {
		oPlayer.hsp_carry = hsp
		show_debug_message("hit")
	}
}
*/