extends Area2D

const SPEED := 400

@onready var anim = $anim
@onready var collision = $colision
@onready var screen_size = get_viewport_rect().size
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED

	if velocity.x != 0:
		anim.play("move")
	elif velocity.y > 0:
		anim.play("move_down")
	elif velocity.y < 0:
		anim.play("move_up")
	else:
		anim.play("idle")
		
	if velocity.x > 0:
		anim.flip_h = false
	else:
		anim.flip_h = true
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
