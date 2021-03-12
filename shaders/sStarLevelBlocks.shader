//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Special shader for the blocks in star levels
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_outline_w;
uniform float u_outline_h;
uniform float u_texture_h_offset;
uniform float u_texture_v_offset;
uniform float u_tex_size;
uniform vec2 u_cam_pos;
uniform vec3 u_outline_color;
uniform sampler2D u_block_texture;

void main()
{
    float alpha = 1.0;
    float current_alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
    vec2 offset;
    
    for(float xx=-1.0; xx<2.0; xx++) {
        for(float yy=-1.0; yy<2.0; yy++) {
            offset = vec2(u_outline_w * xx, u_outline_h * yy);
            alpha = min(alpha, texture2D( gm_BaseTexture, v_vTexcoord + offset).a);
        }
    }
    
    if(alpha == 0.0 && current_alpha > 0.0) {  // Is outline
        gl_FragColor = vec4(u_outline_color, 1.0);
    } else {  // Is not outline, draw the assigned texture
        vec2 tex_offset = vec2(u_texture_h_offset, u_texture_v_offset) - (u_cam_pos / vec2(u_tex_size, u_tex_size));  // vec2(u_tex_size * 0.75, u_tex_size * 0.75) for moving
        gl_FragColor = vec4(vec3(1.0), texture2D( gm_BaseTexture, v_vTexcoord ).a) * texture2D( u_block_texture, fract((v_vTexcoord * vec2(800.0 / u_tex_size, 608.0 / u_tex_size)) - tex_offset));
    }
}
