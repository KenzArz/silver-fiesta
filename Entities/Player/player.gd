extends CharacterBody2D
@onready var currentAnimation = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Input, Movement, and animation handler.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		currentAnimation.play("animationWalk")
		currentAnimation.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		currentAnimation.play("animationIdle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
