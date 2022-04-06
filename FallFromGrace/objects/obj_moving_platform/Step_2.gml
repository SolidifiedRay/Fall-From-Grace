/// @description Insert description here
// You can write your code in this editor

// Move
x += hsp;
y += vsp;

// Check if it's at start position
if (goingToStart && point_distance(x, y, startX, startY) < currentSpeed){
	goingToStart = false;
	currentSpeed = 0;
	alarm[0] = waitTime;
}
// Check if it's at ending position
else if (!goingToStart && point_distance(x, y, endX, endY) < currentSpeed) {
	goingToStart = true;
	currentSpeed = 0;
	alarm[0] = waitTime;
}
