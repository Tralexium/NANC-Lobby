///scrDrawTextSquareOutlineExt(x, y, string, text_color, outline_color, outline_size, halign, valign, xscale, yscale)

var _x = argument[0];
var _y = argument[1];
var _string = argument[2];
var _text_color = argument[3];
var _outline_color = argument[4];
var _outline_size = argument[5];
var _halign = argument[6];
var _valign = argument[7];
var _xscale = argument[8];
var _yscale = argument[9];


// Make the text surface
var _text_w = string_width(_string) + (_outline_size * 2);
var _text_h = string_height(_string) + (_outline_size * 2);
var _surf_w = surface_get_width(global.text_outline_surf);
var _surf_h = surface_get_height(global.text_outline_surf);
var _surf_x = _x;
var _surf_y = _y;
switch(_halign) {
    case fa_center:
        _surf_x = _x - _text_w/2;
        break;
    case fa_right:
        _surf_x = _x - _text_w;
        break;
}
switch(_valign) {
    case fa_middle:
        _surf_y = _y - _text_h/2;
        break;
    case fa_bottom:
        _surf_y = _y - _text_h;
        break;
}

if(!surface_exists(global.text_outline_surf)) {
    global.text_outline_surf = surface_create(global.text_outline_surf_w, global.text_outline_surf_h);
}

surface_set_target(global.text_outline_surf);
    draw_clear_alpha(c_black, 0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_colour(_text_color);
    draw_text_transformed(_outline_size + _surf_w/2, _outline_size + _surf_h/2, _string, _xscale, _yscale, 0);
surface_reset_target();


// Shader related
var _shader = sSquareOutline;
var _shader_outline_width_u = shader_get_uniform(_shader, "outline_width");
var _shader_outline_height_u = shader_get_uniform(_shader, "outline_height");
var _shader_color_u = shader_get_uniform(_shader, "outline_color");
var _shader_outline_width = _outline_size/_surf_w;
var _shader_outline_height = _outline_size/_surf_h;
var _shader_color;
    _shader_color[0] = colour_get_red(_outline_color)/255.0;    // R
    _shader_color[1] = colour_get_green(_outline_color)/255.0;  // G
    _shader_color[2] = colour_get_blue(_outline_color)/255.0;   // B

shader_set(_shader);
    // Set the outline shader uniforms
    shader_set_uniform_f(_shader_outline_width_u, _shader_outline_width);
    shader_set_uniform_f(_shader_outline_height_u, _shader_outline_height);
    shader_set_uniform_f_array(_shader_color_u, _shader_color);
    draw_surface(global.text_outline_surf, _surf_x - _surf_w/2, _surf_y - _surf_h/2);
shader_reset();
