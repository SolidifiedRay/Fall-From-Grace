for (i = 0; i < 4; i++) {
	checkpoint = instance_create_layer(x,y,"instances",obj_racecheckpoint);
	checkpoint.image_angle = 90 * -i;
	checkpoint.checknum = i;
	checkpoint.image_yscale = 20;
}
