extends Camera2D
@export var smooth_speed = 8.0
@export var target: Node2D
@export var look_ahead_distance = 100.0
var look_ahead_offset = Vector2.ZERO

func _physics_process(delta):
	if target:
		var direction = Input.get_axis("ui_left", "ui_right")
		
		var target_offset = Vector2(direction * look_ahead_distance, 0)
		
		# Turunin nilai untuk lebih smooth (3-5 = smooth, 8-10 = medium, 15+ = cepat)
		look_ahead_offset = look_ahead_offset.lerp(target_offset, 4.0 * delta)
		
		var target_pos = target.global_position + look_ahead_offset
		global_position = global_position.lerp(target_pos, 8.0 * delta)
