function auto_tile(tileset,UNIT_W,UNIT_H) {
    var obj = obj_solid;

    var coll_e = position_meeting(x + UNIT_W, y, obj);
    var coll_n = position_meeting(x, y - UNIT_H, obj);
    var coll_w = position_meeting(x - UNIT_W, y, obj);
    var coll_s = position_meeting(x, y + UNIT_H, obj);

    var coll_ne = coll_n && coll_e && (position_meeting(x + UNIT_W, y - UNIT_H, obj) );
    var coll_nw = coll_n && coll_w && (position_meeting(x - UNIT_W, y - UNIT_H, obj) );
    var coll_se = coll_s && coll_e && (position_meeting(x + UNIT_W, y + UNIT_H, obj) );
    var coll_sw = coll_s && coll_w && (position_meeting(x - UNIT_W, y + UNIT_H, obj) );

    var mask_arr = [
        coll_nw, // 1
        coll_n, // 2
        coll_ne, // 4
        coll_w, // 8
        coll_e, // 16
        coll_sw, // 32
        coll_s, // 64
        coll_se // 128
    ];
 
    var bitmask = 0;

    for (var i = 0; i < 8; i++) {
        var value = mask_arr[i] ? 1 : 0;
        bitmask += value << i;
		
    }
    show_debug_message(coll_e);
    // tileIndexes[] declaration intentionally omitted

    tileIndex = global.indexes[bitmask];

    // Update tile on room's tilemap
    var data = tilemap_get(tileset, x / UNIT_W, y / UNIT_H);
    var newData = tile_set_index(data, tileIndex);

    tilemap_set(tileset, newData, x / UNIT_W, y / UNIT_H);
}
