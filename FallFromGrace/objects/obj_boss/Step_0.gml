
hp = (checkpointcount - obj_player.checknum) / checkpointcount;
starradius = 1000 * hp;
if (not dead){
	var stardir = random(360);
	var stardist = random(starradius);
	repeat(4) {
		var stardir = random(360);
		var stardist = random(starradius);

		star = irandom(1) ? instance_create_layer(x+lengthdir_x(stardist,stardir),y+lengthdir_y(stardist,stardir),"instances",obj_star)
		: instance_create_layer(x+lengthdir_x(stardist,stardir),y+lengthdir_y(stardist,stardir),"instances",obj_blob);
		//star.image_blend = irandom(c_white);
		star.image_blend = irandom(1) ? c_white : c_black;
		star.gravity = 0.1;
		star.gravity_direction = stardir + 180;
		star.image_xscale = random_range(1,3);
		star.image_yscale = star.image_xscale
	}
	if (checkpoint0.checked) {
		obj_player.phaselock = true;

		cooldown--;
		if (!obj_player.dead && cooldown < 0) {
			switch (clock mod 215) {
				case 0: pattern = 1; break;
				case 45: pattern = 2; break;
				case 90: pattern = 3; break;
				case 135: pattern = 4; break;
				case 180: pattern = 5; break;
			}
			
			switch(pattern) {
				case 0: break;
				case 1:
					switch irandom(4) { // basic slash
						case 0: //horizontal 
							newrs = instance_create_layer(obj_player.x-150,obj_player.y, "Collision", obj_riftslash)
							newrs.speed =50;
							newrs.direction = 0;
							newrs.alarm[0]=10;
						break;
		
						case 1://vertical
							newrs = instance_create_layer(obj_player.x, obj_player.y-300, "Collision",obj_riftslash)
							newrs.speed = 50;
							newrs.direction = -90;
							newrs.alarm[0]=10;
						break;
		
						case 2://left up to right down
							newrs = instance_create_layer(obj_player.x-150, obj_player.y-150, "Collision",obj_riftslash)
							newrs.speed = 50;
							newrs.direction = -45;
							newrs.alarm[0]=10;
						break;
		
						case 3://right up to left down
							newrs = instance_create_layer(obj_player.x+150, obj_player.y-150, "Collision",obj_riftslash)
							newrs.speed = 50;
							newrs.direction = -135;
							newrs.alarm[0]=10;
						break;
		
						case 4:
							newrs1 = instance_create_layer(obj_player.x-150, obj_player.y-150, "Collision",obj_riftslash)
							newrs1.speed = 50;
							newrs1.direction = -45;
							newrs1.alarm[0]=10;
			
							newrs2 = instance_create_layer(obj_player.x+150, obj_player.y-150, "Collision",obj_riftslash)
							newrs2.speed = 50;
							newrs2.direction = -135;
							newrs2.alarm[0]=10;
						break;
					}
					break;
				case 2: // lead
					rad1 = 150;
					rad2 = 300;
					l1 = 300;
					l2 = 600;
					dir = point_direction(0,0,obj_player.hsp, obj_player.vsp);
					dx1 = dcos(dir);
					dy1 = -dsin(dir);
				
					flip = irandom(1) ? -1 : 1;
					dx2 = dcos(dir+90*flip);
					dy2 = -dsin(dir+90*flip);
				
					newrs1 = instance_create_layer(obj_player.x+dx1*l1+dx2*rad1, obj_player.y+dy1*l1+dy2*rad1, "Collision",obj_riftslash);
					newrs1.speed = 50;
					newrs1.direction = dir+90*-flip;
					newrs1.alarm[0]=10;
				
					flip = irandom(1) ? -1 : 1;
					dx2 = dcos(dir+90*flip);
					dy2 = -dsin(dir+90*flip);
				
					newrs1 = instance_create_layer(obj_player.x+dx1*l2+dx2*rad2, obj_player.y+dy1*l2+dy2*rad2, "Collision",obj_riftslash);
					newrs1.speed = 60;
					newrs1.direction = dir+90*-flip;
					newrs1.alarm[0]=20;
					break;
				case 3: //above
					newrs = instance_create_layer(obj_player.x, obj_player.y-600, "Collision",obj_riftslash)
					newrs.speed = 50;
					newrs.direction = 0;
					newrs.alarm[0]=10;
					newrs = instance_create_layer(obj_player.x, obj_player.y-600, "Collision",obj_riftslash)
					newrs.speed = 50;
					newrs.direction = 180;
					newrs.alarm[0]=10;
					break;
				case 4: //ring
					rad = point_distance(x,y,obj_player.x,obj_player.y);
					dir = point_direction(x,y,obj_player.x,obj_player.y);
					perim = 2*pi*rad;
					steps = perim div 64;
					for (i = -180; i < 180; i += 360 / steps) {
						dir2 = dir + i;
						newfr = instance_create_layer(x+lengthdir_x(rad,dir2),y+lengthdir_y(rad,dir2),"rifts",obj_futurerift);
						newfr.alarm[0] = (180-abs(dir-dir2))*30/180 + 60;
						newfr.riftduration = 30;
					}
					break;
				case 5: // a basic shot
					dir = point_direction(x,y,obj_player.x,obj_player.y);
					for (i = -30; i <= 30; i += 30) {
						newrs = instance_create_depth(x,y,depth,obj_riftslash);
						newrs.alarm[0] = 60;
						newrs.riftsize = 32;
						newrs.lentospawn = 64;
						newrs.direction = dir+i;
						newrs.speed = 16;
						newrs.riftduration=15;
						newrs.warningduration=30;
						
					}
					break;
			}
			pattern = 0;
		}
		if (obj_player.dead) cooldown = 60;
		if (abs(angletotal) > deadangle) {
			dead = true;
			corpse = instance_create_depth(x,y,depth,obj_god);
			corpse.image_xscale = 32;
			corpse.image_yscale = 32;
			corpse.visible=false;
			repeat(200) {
				var stardir = random(360);
				var stardist = random_range(10,20);

				star = irandom(1) ? instance_create_layer(x,y,"instances",obj_star)
				: instance_create_layer(x,y,"instances",obj_blob);
				//star.image_blend = irandom(c_white);
				star.image_blend = irandom(1) ? c_white : c_black;
				star.speed = stardist;
				star.friction = stardist/irandom_range(60,80);
				star.direction = stardir;
				star.image_xscale = random_range(10,30);
				star.image_yscale = star.image_xscale
			}
		}
	} else {
		angletotal = 0;
	}
	
	if (clock mod 4 == 0) {
		stardist = random(128);
		newfr = instance_create_layer(x+lengthdir_x(stardist,stardir),y+lengthdir_y(stardist,stardir),"rifts",obj_futurerift);
		newfr.alarm[0]=16;
		newfr.riftduration = 16;
	}
	clock++;
} else {
	obj_player.phaselock = false;
	instance_destroy(obj_rift_that_disappears);
	instance_destroy(grapple);
	if (madegod = false) {
		madegod = true;
		_y = y;
		while (!collision_point(x,_y,obj_wall,false,true)) {
			_y++;
		}
		instance_create_depth(x,_y,depth-1,obj_god);
	}
}
