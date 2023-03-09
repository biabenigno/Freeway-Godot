extends Area2D
@export var velocidade = 500
var tamanho_tela
signal pontuar

func _ready():
	position = Vector2(780,680)
	tamanho_tela=get_viewport_rect().size


func _process(delta):
	var dir = Vector2()
	if(Input.is_action_pressed("Down")):
		dir.y = velocidade
	if(Input.is_action_pressed("Up")):
		dir.y = -velocidade
		
	position += (dir*delta)
	position.y = clamp(position.y, 0 , tamanho_tela.y)
	
	if dir.length() > 0 :
		if dir.y > 0 :
			$AnimatedSprite2D.animation = "Baixo"
		else:
			$AnimatedSprite2D.animation = "Cima"
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()


func _on_Galinha_body_entered(body):
	if(body.name == 'LinhaDeChegada'):
		$Pontuar.play()
		emit_signal("pontuar")
	$Colisao.play()
	position = Vector2(640,680)
