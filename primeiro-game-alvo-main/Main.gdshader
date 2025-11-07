shader_type canvas_item;

uniform vec4 center_color : source_color = vec4(0.4, 0.7, 1.0, 1.0);  // Azul claro no centro
uniform vec4 edge_color : source_color = vec4(0.1, 0.3, 0.9, 1.0);     // Azul escuro nas bordas
uniform float gradient_intensity = 1.5;
uniform float rim_intensity = 0.3;

void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	
	// Distância do centro (0.0 no centro, 1.0 nas bordas)
	vec2 centered_uv = UV - vec2(0.5);
	float dist = length(centered_uv) * 2.0;
	
	// Cria o gradiente radial
	float gradient = pow(dist, gradient_intensity);
	vec4 color = mix(center_color, edge_color, clamp(gradient, 0.0, 1.0));
	
	// Adiciona rim lighting (brilho nas bordas)
	float rim = 1.0 - dist;
	rim = pow(rim, 3.0) * rim_intensity;
	color.rgb += vec3(rim);
	
	// Aplica a textura original como máscara
	COLOR = color * tex;
	COLOR.a = tex.a;
}