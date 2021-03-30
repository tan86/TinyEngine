#version 330 core

layout (location = 0) in vec3 in_Position;
layout (location = 1) in vec3 in_Normal;
layout (location = 2) in vec4 in_Color;

out vec3 ex_FragPos;
out vec4 ex_Color;

uniform mat4 vp;

const vec3 dir = vec3(1,2,3);

void main(void){
	float diffuse  = 0.8*max(dot(in_Normal, normalize(dir)), 0.0);
	float ambient = 0.2;

	gl_Position = vp*vec4(in_Position, 1.0f);
	ex_Color = vec4((ambient+diffuse)*in_Color.xyz, 1.0);
}
