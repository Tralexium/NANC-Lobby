/// scrAlexDrawPieTexExt(x, y, value, texture, sprite, image_index, color, alpha)
// Original code by YellowAfterlife

// MAKE SURE THE SPRITE ORIGIN IS CENTERED!!!

var v, tex, tex_w, tex_h, spr, i_index, color, alpha, x_center, y_center, x1, y1, x2, y2, xm, ym, vd, vx, vy, vl;

x_center = argument0;
y_center = argument1;
v = argument2;
tex = argument3;
spr = argument4;
i_index = argument5;
color = argument6;
alpha = argument7;

if (v <= 0) return 0; // nothing to be drawn

// Check if it's a full pie, if so skip the maths and just draw the sprite
if (v >= 1) {
    return draw_sprite_ext(spr, i_index, x_center, y_center, 1, 1, 0, color, alpha);
}

tex_w = sprite_get_width(spr);
tex_h = sprite_get_height(spr);
x1 = x_center - tex_w/2; y1 = y_center - tex_h/2; // top-left corner
x2 = x_center + tex_w/2; y2 = y_center + tex_h/2; // bottom-right corner
xm = (x1 + x2) / 2; ym = (y1 + y2) / 2; // middle point

draw_primitive_begin_texture(pr_trianglefan, tex);
draw_vertex_texture_colour(xm, ym, 0.5, 0.5, color, alpha); draw_vertex_texture_colour(xm, y1, 0.5, 0, color, alpha);

// draw corners:
if (v >= 0.125) draw_vertex_texture_colour(x2, y1, 1, 0, color, alpha);
if (v >= 0.375) draw_vertex_texture_colour(x2, y2, 1, 1, color, alpha);
if (v >= 0.625) draw_vertex_texture_colour(x1, y2, 0, 1, color, alpha);
if (v >= 0.875) draw_vertex_texture_colour(x1, y1, 0, 0, color, alpha);

// calculate angle & vector from value:
vd = pi * (v * 2 - 0.5);
vx = cos(vd);
vy = sin(vd);

// normalize the vector, so it hits -1\+1 at either side:
vl = max(abs(vx), abs(vy));
if (vl < 1) {
    vx /= vl;
    vy /= vl;
}

draw_vertex_texture_colour(xm + vx * (x2 - x1) / 2, ym + vy * (y2 - y1) / 2, 0.5 + vx * 0.5, 0.5 + vy * 0.5, color, alpha);
draw_primitive_end();
