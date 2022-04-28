/// @description Insert description here
// You can write your code in this editor

if (!loosefill) {
	frame = instance_create_depth(x,y,depth-1, obj_frame);
	frame.container = self;
	frame.image_xscale *= 2;
	frame.image_yscale *= 2;
}
