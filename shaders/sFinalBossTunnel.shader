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

//######################_==_YOYO_SHADER_MARKER_==_######################@~// @lsdlive
// CC-BY-NC-SA


varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_shadow_line_thicness;



mat2 r2d(float a) {
    float c = cos(a), s = sin(a);
    return mat2(c, s, -s, c);
}

// Tunnel pattern studied from shane & shau
// i.e. https://www.shadertoy.com/view/4tKXzV
vec2 path(float t) {
    float a = sin(t*.2 + 1.5), b = sin(t*.2);
    return vec2(a*2., a*b);
}

// http://mercury.sexy/hg_sdf/
// hglib mirrorOctant
void mo(inout vec2 p, vec2 d) {
    p = abs(p) - d;
    if (p.y > p.x)p = p.yx;
}

// hglib pMod1
float re(float p, float d) {
   return mod(p - d * .5, d) - d * .5;
}

// hglib pModPolar
void amod(inout vec2 p, float d) {
    float a = re(atan(p.x, p.y), d);
    p = vec2(cos(a), sin(a)) * length(p);
}

// iq's signed cross sc() - http://iquilezles.org/www/articles/menger/menger.htm
float sc(vec3 p, float d) {
    p = abs(p);
    p = max(p, p.yzx);
    return min(p.x, min(p.y, p.z)) - d;
}

float g = 0.;
float de(vec3 p) {
    
    p.xy -= path(p.z);
    
    p.xy *= r2d(p.z*.07);
    
    vec3 q = p;
    
    // cylinder section
    amod(q.xy, 6.28 / 7.);
    mo(q.xy, vec2(1, .7));
    q.xy *= r2d(q.z*.4);
    mo(q.xy, vec2(.1, .2));
    amod(q.xy, 6.28 / 3.);
    float cyl2 = length(q.xy) - u_shadow_line_thicness;  // Shadow line thickness (the float number val, .05 is default)
    
    p.z = re(p.z, .8);
        
    // cross structure section
    amod(p.xy, .785*3.);
    mo(p.xz, vec2(5, .01));
    amod(p.xy, .785*.5);
    p.x = abs(p.x) - 2.1;
    mo(p.xy, vec2(.4, 2));
    float d = sc(p, .02);
        
    g += .005 / (.01 + d * d);// glow trick from balkhan https://www.shadertoy.com/view/4t2yW1
    d = min(d, cyl2); // outside of the glow computation for cool effect & better contrast
        
    return d;
}

void main()
{
    vec2 uv = (vec2(1.0, 1.0) - v_vTexcoord.xy*2.0) * vec2(-1.0, 1.0); //(fragCoord - .5*iResolution.xy) / iResolution.y;
    
    float dt = u_time;
    vec3 ro = vec3(0, 0, -3. + dt);
    vec3 ta = vec3(0, 0, dt);
    
    ro.xy += path(ro.z);
    ta.xy += path(ta.z);
    
    vec3 fwd = normalize(ta - ro);
    vec3 right = normalize(cross(fwd, vec3(0, 1, 0)));
    vec3 up = normalize(cross(right, fwd));
    vec3 rd = normalize(fwd + right * uv.x + up * uv.y);
    
    vec3 p;
    float t = 0., ri;
    for (float i = 0.; i < 1.; i += .03) {
        ri = i;
        p = ro + rd * t;
        float d = de(p);
        d =max(abs(d), .006); // phantom mode trick from aiekick https://www.shadertoy.com/view/MtScWW
        t += d * .8;
    }
        
    // Apply gradient color
    vec3 c = mix(vec3(.3, .2, .0), vec3(.2, .0, .2), uv.y/2.0 + ri);
    
    // Apply contrast
    float contrast = 1.3;
    c = ((c - vec3(0.5)) * contrast) + vec3(0.5);
    c += g * .03;// glow trick from balkhan https://www.shadertoy.com/view/4t2yW1
    
    gl_FragColor = vec4(c, 1);
}
