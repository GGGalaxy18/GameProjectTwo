//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord );
    vec3 lum = vec3(0.299, 0.587, 0.114);
	float bw = dot(Color.rgb, lum);
    vec4 shade = vec4(vec3(bw), Color.a);
	gl_FragColor = mix(shade, Color, .2);
	//layout(location = 0) out vec4(vec3(dot( Color.rgb, lum)), Color.a);
}
