UNIT_W = 16;
UNIT_H = 16;
for (_xx = 0; _xx < room_width; _xx += UNIT_W) {
	for (_yy = 0; _yy < room_height; _yy += UNIT_H) {
		if (position_meeting(_xx,_yy,obj_wall)) {
			instance_create_depth(_xx & ~15,_yy & ~15,-1,obj_solid);
			show_debug_message("a");
		}
		if (position_meeting(_xx,_yy,obj_nograpple)) {
			instance_create_depth(_xx & ~15,_yy & ~15,-1,obj_solid2);
			show_debug_message("a");
		}
	}
}

UNIT_H = 16;
UNIT_W = 16;

var layerId = layer_create(0, "AutoTile");
var tileables = [
    { object: obj_solid, tilesetSprite: tileset_scifi2 },
]
for (var i = 0; i < array_length(tileables); i++) {
    var tileable = tileables[i];
    
    var ts = layer_tilemap_create(layerId, 0, 0, tileable.tilesetSprite, room_width / UNIT_W, room_height / UNIT_H);
    with (tileable.object) {
        tileset = ts;
    }
}
with (obj_solid) {
    auto_tile(tileset, 16, 16);
}



var layerId = layer_create(-1, "AutoTile1");
var tileables = [
    { object: obj_solid2, tilesetSprite: tileset_scifi1 },
]
for (var i = 0; i < array_length(tileables); i++) {
    var tileable = tileables[i];
    
    var ts = layer_tilemap_create(layerId, 0, 0, tileable.tilesetSprite, room_width / UNIT_W, room_height / UNIT_H);
    with (tileable.object) {
        tileset = ts;
    }
}
with (obj_solid2) {
    auto_tile(tileset, 16, 16);
}

instance_destroy(obj_solid2);

instance_destroy(obj_solid);

