/// @description Insert description here
// You can write your code in this editor

tx[tcounter] = x;
ty[tcounter] = y;
tcounter++;
tcounter = tcounter mod tlen;

disttraveled+=speed;
if disttraveled > lentospawn {
	newrift = instance_create_layer(x,y, "Collision", obj_futurerift);
	newrift.alarm[0] = warningduration;
	newrift.riftduration = riftduration;
	newrift.riftsize = riftsize;
	disttraveled -= lentospawn; 
}



