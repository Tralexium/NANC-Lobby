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
// Distortion shader with colour aberration
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float fx_strength;
uniform float aspect;
uniform float aberration;
uniform sampler2D tex_waves;

void main()
{
    // OFFSET FROM NORMAL
    vec2 offset = (texture2D(tex_waves, v_vTexcoord).rg - 0.5) * 2.0 * fx_strength;
    offset.x    /= aspect;
    
    
    // COLOUR ABERRATION
    vec4 out_col;
    out_col     = (texture2D(gm_BaseTexture, v_vTexcoord + offset) +
                   texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 - aberration)) * vec4(1.0, 0.0, 1.0, 1.0) + 
                   texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 + aberration)) * vec4(0.0, 1.0, 1.0, 1.0)) *
                   vec4(0.5, 0.5, 0.33, 0.33);
    
    // OUTPUT
    gl_FragColor = out_col;
}

