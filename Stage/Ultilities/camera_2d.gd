extends Camera2D
@export var smooth_speed = 8.0
@export var target: Node2D
@export var look_ahead_horizontal = 100.0  # Jarak horizontal (kiri/kanan)
@export var look_ahead_vertical = 80.0     # Jarak vertikal (atas/bawah)
var look_ahead_offset = Vector2.ZERO

func _physics_process(delta):
	if target:
		# Ambil direction horizontal dan vertical
		var h_direction = Input.get_axis("ui_left", "ui_right")
		var v_direction = Input.get_axis("ui_up", "ui_down")
		
		# Target offset dengan X dan Y
		var target_offset = Vector2(
			h_direction * look_ahead_horizontal,
			v_direction * look_ahead_vertical
		)
		
		# Turunin nilai untuk lebih smooth
		look_ahead_offset = look_ahead_offset.lerp(target_offset, 4.0 * delta)
		
		var target_pos = target.global_position + look_ahead_offset
		global_position = global_position.lerp(target_pos, 8.0 * delta)
