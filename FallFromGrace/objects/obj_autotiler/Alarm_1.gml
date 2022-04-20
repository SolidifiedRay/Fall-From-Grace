UNIT_H = 16;
UNIT_W = 16;

var layerId = layer_create(0, "AutoTile");
var tileables = [
    { object: obj_solid, tilesetSprite: tileset_ts3 },
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

instance_destroy(obj_solid);
