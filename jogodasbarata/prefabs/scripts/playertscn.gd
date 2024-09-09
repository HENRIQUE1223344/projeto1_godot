extends Area2D

signal hit

const SPEED := 400
# Filhao, isso ai é uma variavel de velocidade.
@onready var anim = $Anim
@onready var Collision = $Collision
@onready var screen_size = get_viewport_rect().size

func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	if velocity.x != 0:
		anim.play("move");
	elif velocity.y > 0:
		anim.play("move_down");
	elif velocity.y < 0:
		anim.play("move_up");
	else:
		anim.play("idle");
		
	if velocity.x > 0:
		anim.flip_h=false
	else:
		anim.flip_h=true
# aqui é a animação para cada movimento	


	position += velocity * delta	
# Entao amigo qq acontece, aqui eu estou invocando a função de movimento do bonequinho.	
	
	position = position.clamp(Vector2.ZERO, screen_size)
# Entao amigo qq acontece, esse bota um limite as bordas da tela pro boneco nao fazer varzea.

# amigo, isso aqui é para a colisao do personagem, serve p verificar
func _on_body_entered(body: Node2D): 
	
	hit.emit()
	Collision.set_deferred("disabled", true)
	
#esse aqui é para mostrar o personagem.	
func start_pos(pos):
	position = pos
	show()
	Collision.disabled = false
