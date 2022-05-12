
global.psystem = part_system_create_layer("instances",false);
global.star1 = part_type_create();
part_type_sprite(global.star1, spr_star,1,1,0);
part_type_blend(global.star1, 1);
part_type_life(global.star1, 8, 32);
part_type_color1(global.star1, c_yellow);

global.star2 = part_type_create();
part_type_sprite(global.star2, spr_star,1,1,0);
part_type_blend(global.star2, 1);
part_type_life(global.star2, 8, 32);
part_type_color1(global.star2, c_white);

global.star3 = part_type_create();
part_type_sprite(global.star3, spr_star,1,1,0);
part_type_blend(global.star3, 1);
part_type_life(global.star3, 8, 32);
part_type_color1(global.star3, c_aqua);

global.blob1 = part_type_create();
part_type_sprite(global.blob1,spr_blob,1,1,0);
part_type_blend(global.blob1,1);
part_type_life(global.blob1,8,32);
part_type_color1(global.blob1,c_white);
part_type_speed(global.blob1,0.05,0.2,0,0);
part_type_direction(global.blob1,90,90,0,0);

global.blob2 = part_type_create();
part_type_sprite(global.blob2,spr_blob,1,1,0);
part_type_blend(global.blob2,1);
part_type_life(global.blob2,8,32);
part_type_color_mix(global.blob2,c_red,c_yellow);
part_type_speed(global.blob2,0.05,0.2,0,0);
part_type_direction(global.blob2,90,90,0,0);

global.pemitter = part_emitter_create(global.psystem);
part_emitter_region(global.psystem,global.pemitter,x,y,aimx,aimy,ps_shape_line,ps_distr_linear);

global.ropeactive = part_type_create();
part_type_sprite(global.ropeactive,spr_blob,1,1,1);
//part_type_shape(global.ropetrue,pt_shape_spark);
part_type_size(global.ropeactive, 1, 2, 0, 0);
part_type_blend(global.ropeactive, bm_add);
part_type_life(global.ropeactive, 4, 8);
part_type_alpha2(global.ropeactive,1,0);
part_type_color_mix(global.ropeactive, c_aqua, c_white);
part_type_orientation(global.ropeactive,0,359,0,0,0);

global.ropetrue = part_type_create();
part_type_sprite(global.ropetrue,spr_blob,1,1,1);
//part_type_shape(global.ropetrue,pt_shape_spark);
part_type_size(global.ropetrue, 1, 2, 0, 0);
part_type_blend(global.ropetrue, bm_add);
part_type_life(global.ropetrue, 4, 8);
part_type_alpha2(global.ropetrue,1,0);
part_type_color_mix(global.ropetrue, c_green, c_yellow);
part_type_orientation(global.ropetrue,0,359,0,0,0);

global.ropefalse = part_type_create();
part_type_sprite(global.ropefalse,spr_blob,1,1,1);
//part_type_shape(global.ropefalse,pt_shape_spark);
part_type_size(global.ropefalse, 1, 2, 0, 0);
part_type_blend(global.ropefalse, bm_add);
part_type_life(global.ropefalse, 4, 6);
part_type_alpha2(global.ropefalse,1,0);
part_type_color1(global.ropefalse, $1111ff);
part_type_orientation(global.ropefalse,0,359,0,0,0);
