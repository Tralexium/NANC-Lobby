/// scrAlexDrawPieTex(x, y, value, texture)
// Original code by YellowAfterlife

// MAKE SURE THE SPRITE ORIGIN IS CENTERED!!!

var v, tex, tex_w, tex_h, x_center, y_center, x1, y1, x2, y2, xm, ym, vd, vx, vy, vl;

x_center = argument0;
y_center = argument1;
v = argument2;
tex = argument3;
tex_w = sprite_get_width(tex);
tex_h = sprite_get_height(tex);

if (v <= 0) return 0; // nothing to be drawn

x1 = x_center - tex_w/2; y1 = y_center - tex_h/2; // top-left corner
x2 = x_center + tex_w/2; y2 = y_center + tex_h/2; // bottom-right corner

if (v >= 1) return draw_sprite(tex, 0, x_center, y_center); // entirely filled

xm = (x1 + x2) / 2; ym = (y1 + y2) / 2; // middle point

draw_primitive_begin_texture(pr_trianglefan, tex);
draw_vertex_texture(xm, ym, 0.5, 0.5); draw_vertex_texture(xm, y1, 0.5, 0);

// draw corners:
if (v >= 0.125) draw_vertex_texture(x2, y1, 1, 0);
if (v >= 0.375) draw_vertex_texture(x2, y2, 1, 1);
if (v >= 0.625) draw_vertex_texture(x1, y2, 0, 1);
if (v >= 0.875) draw_vertex_texture(x1, y1, 0, 0);

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

draw_vertex_texture(xm + vx * (x2 - x1) / 2, ym + vy * (y2 - y1) / 2, 0.5 + vx * 0.5, 0.5 + vy * 0.5);
draw_primitive_end();
