var angle = 12;

for (i = 0; i < 32; i++) {
	checkpoint = instance_create_layer(x,y,"instances",obj_racecheckpoint);
	checkpoint.image_angle = angle * -i;
	checkpoint.checknum = i;
	checkpoint.image_yscale = 20;
	checkpoint.image_alpha = 0.01;
	checkpoint = instance_create_layer(x,y,"instances",obj_racecheckpoint);
	checkpoint.image_angle = angle *  i;
	checkpoint.checknum = i;
	checkpoint.image_yscale = 20;
	checkpoint.image_alpha = 0.01;
}
