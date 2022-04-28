/// @description Insert description here
// You can write your code in this editor

tx[tcounter] = x;
ty[tcounter] = y;
tcounter++;
tcounter = tcounter mod tlen;
rotation = point_direction(0,0,hsp,vsp);

newrift = instance_create_layer(x,y, "Collision", obj_futurerift);
newrift.alarm[0] = 20;

x += hsp;
y += vsp;
