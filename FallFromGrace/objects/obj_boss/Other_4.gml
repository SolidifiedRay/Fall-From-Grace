var angle = 12;

checkpointcount = 120;
offset = 0;
for (i = 0; i < checkpointcount; i++) {
	checkpoint = instance_create_layer(x,y,"instances",obj_racecheckpoint);
	checkpoint.image_angle = offset+angle * -i;
	checkpoint.checknum = i;
	checkpoint.image_yscale = 20;
	checkpoint.image_alpha = 0.1;
	if (i == 0) checkpoint0 = checkpoint;
	checkpoint = instance_create_layer(x,y,"instances",obj_racecheckpoint);
	checkpoint.image_angle = offset+angle *  i;
	checkpoint.checknum = i;
	checkpoint.image_yscale = 20;
	checkpoint.image_alpha = 0.1;
}
