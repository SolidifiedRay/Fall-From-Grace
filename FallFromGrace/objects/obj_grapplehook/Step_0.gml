/// @description Insert description here
// You can write your code in this editor



hsp = lengthdir_x(sp, direction);
vsp = lengthdir_y(sp, direction);

if (collision_line(x,y,x + hsp, y + vsp, obj_wall,0,0))
{
	while (!position_meeting(x + sign(hsp), y + sign(vsp), obj_wall))
	{
		x += sign(hsp);
		y += sign(vsp);
	}
	instance_destroy();
	hook = instance_create_layer(x,y,"instances",obj_grapplepoint);
	hook.image_angle = direction;
}

//if (sp < spmax) {
	sp += acceleration;
//} else sp = spmax;


x += hsp;
y += vsp;