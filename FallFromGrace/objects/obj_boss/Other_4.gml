
for (i = 0; i < checkpointcount; i++) {
	checkpoint = instance_create_layer(x,y,"instances",obj_racecheckpoint);
	checkpoint.image_angle = offset+angle * -i;
	checkpoint.checknum = i;
	checkpoint.image_yscale = 20;
	checkpoint.image_alpha = 0.1;
	checkpoint.visible = false;
	if (i == 0) checkpoint0 = checkpoint;
	checkpoint = instance_create_layer(x,y,"instances",obj_racecheckpoint);
	checkpoint.image_angle = offset+angle *  i;
	checkpoint.checknum = i;
	checkpoint.image_yscale = 20;
	checkpoint.image_alpha = 0.1;
	checkpoint.visible = false;
}