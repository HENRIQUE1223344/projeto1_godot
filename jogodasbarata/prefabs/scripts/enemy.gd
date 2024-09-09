extends RigidBody2D
@onready var Anim = $Anim

# Esse é pra aleatoridade das cores das baratas
func _ready():
	var enemy_types = Anim.sprite_frames.get_animation_names()
	Anim.play(enemy_types[randi() % enemy_types.size()])
	print(enemy_types)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_visible_screen_exited() -> void:
	queue_free()
