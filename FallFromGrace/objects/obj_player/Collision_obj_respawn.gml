/// @description Insert description here
// You can write your code in this editor

if !dead{
	spawnx = other.x;
	spawny = other.y - sprite_height;
	while (!place_meeting(spawnx,spawny+1,obj_wall)) {
		spawny++;
	}
}
