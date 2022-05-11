var anglediff = lastangle - point_direction(x,y,obj_player.x,obj_player.y);
if anglediff > 180 anglediff -= 360;
if anglediff < -180 anglediff += 360;
if !obj_player.dead angletotal += anglediff;
lastangle = point_direction(x,y,obj_player.x,obj_player.y);
show_debug_message(angletotal);

if (obj_player.dead) offset=0;

