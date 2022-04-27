
hsp = 0;
vsp = 0;
grav = 0;
grav_dir = 0;
target = noone;

if instance_exists(obj_boss) {
	target = obj_boss;
	grav = 0.1;
	alarm[0] = 350;
}
