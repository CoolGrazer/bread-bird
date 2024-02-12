shader_type canvas_item;

uniform vec4 ogColor : source_color = vec4(0.094,0.161,0.031,1.0);

uniform vec4 color : source_color;



void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if (distance(COLOR,ogColor) < 0.01)
	{
		COLOR = color;
	}
}

