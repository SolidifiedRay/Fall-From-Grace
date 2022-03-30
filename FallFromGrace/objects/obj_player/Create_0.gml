/// @desc

// init player movement variables
hsp = 0;
vsp = 0;
grv = 0.25;
maxsp = 8;
walksp = 4;
walkinc = walksp / 6;
walkdec = walksp / 9;
airsp = 7;
airinc = airsp / 30;
airdec = airsp / 45;

in_wall_slide = false;
wall_slide_timer = 0;
wall_slide_dir = 1;
wall_jump_trail = 0;

grounded = 0;

//dashsp = 5.5;
jumpsp = 4;
wjumpvsp = 4.6;
wjumphsp = 4.5;

hookgrv = 0.65;
hookready = true;

in_phase = false;
can_double_jump = false;
//in_dash = false;
//dash_timer = 0;
//dash_length = 4;
//num_dash_left = 1;
 
dir = 5;
hvec = 0;

left = 0;
right = 0;
up = 0;
down = 0;
jump = 0;
//dash = 0;
hook = 0;
old_facing = 1;
rotation = 0;
trailcolor = c_white;
facing = 1;

instance_create_layer(x,y-64,"instances",obj_camera);
dead = false;
winning = false;

totalframes = 0;
frames = totalframes mod 60;
seconds = (totalframes div 60) mod 60;
minutes = seconds div 60;