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
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D distort_tex;
uniform float time;

const float size = 0.5;
const float strength = 0.04;


void main()
{
    vec2 distort;
    distort.x = texture2D(distort_tex, fract(v_vTexcoord * size + vec2(0.0, time))).r * strength;
    distort.y = texture2D(distort_tex, fract(v_vTexcoord * size * 2.0 + vec2(0.0, time * 1.5))).r * strength;

    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + distort);
}

