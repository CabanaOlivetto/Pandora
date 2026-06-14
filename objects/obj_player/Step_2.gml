// Colisão horizontal
var _col = instance_place(x + velh, y, obj_chao); 
if (_col) {
    if (velh > 0) {
        x = _col.bbox_left + (x - bbox_right);
    }
    if (velh < 0) {
        x = _col.bbox_right + (x - bbox_left);
    }
    velh = 0;
}
x += velh; 

// Colisão vertical
var _colv = instance_place(x, y + velv, obj_chao); 
if (_colv) {
    if (velv > 0) {
        y = _colv.bbox_top + (y - bbox_bottom);
    }
    if (velv < 0) {
        y = _colv.bbox_bottom + (y - bbox_top);
    }
    velv = 0;
}
y += velv;