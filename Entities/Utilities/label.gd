extends Label

@export var character_path: NodePath
@onready var character = get_node(character_path)
@onready var anim = character.get_node("AnimatedSprite2D")

#func _ready():
	#self.add_theme_font_size_override("font_size", 10)
	#pass


func _process(_delta):
	var pos = character.global_position
	var vel = character.velocity

	text = "Pos   X: %d  Y: %d\n" % [pos.x, pos.y] \
		+ "Vel   X: %d  Y: %d\n" % [vel.x, vel.y] \
		+ "Animation : " + anim.animation
