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
// Sprite square outline shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float outline_width;
uniform float outline_height;
uniform vec3 outline_color; 

void main()
{
    float alpha = 0.0;
    float current_alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
    vec2 offset;
    
    for(float xx=-1.0; xx<2.0; xx++) {
        for(float yy=-1.0; yy<2.0; yy++) {
            offset = vec2(outline_width * xx, outline_height * yy);
            alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord + offset).a);
        }
    }
    
    if(alpha > 0.0 && current_alpha == 0.0) {  // Is outline
        gl_FragColor = vec4(outline_color, alpha);
    } else {  // Is not outline
        gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    }
}
