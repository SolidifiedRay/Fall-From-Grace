/// @description Insert description here
// You can write your code in this editor

image_speed = random_range(0.2,0.7);
vspeed = random_range(-0.05, -0.2);
switch irandom(3) {
	case 0: image_blend = c_red; break;
	case 1: image_blend = c_orange; break;
	case 2: image_blend = c_yellow; break;
	default: image_blend = c_white; break;
}
