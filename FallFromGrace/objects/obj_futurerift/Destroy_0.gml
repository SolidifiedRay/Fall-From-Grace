
rift = instance_create_layer(x,y,"collision",obj_killBlock);
//rift.image_xscale *= 0.5;
//rift.image_yscale *= 0.5;
rift.x = rift.x & ~31;
rift.y = rift.y & ~31;

rift.image_xscale = riftsize / rift.sprite_width;
rift.image_yscale = rift.image_xscale;
rift.x -= rift.sprite_width / 2;
rift.y -= rift.sprite_height / 2;
rift.alarm[0] = riftduration;
