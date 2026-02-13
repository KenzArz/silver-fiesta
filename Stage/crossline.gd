extends Node2D

@export var size := 100.0
@export var thickness := 2.0

func _draw():
	# garis horizontal
	draw_line(
		Vector2(-size, 0),
		Vector2(size, 0),
		Color.WHITE,
		thickness
	)
	
	# garis vertikal
	draw_line(
		Vector2(0, -size),
		Vector2(0, size),
		Color.WHITE,
		thickness
	)
