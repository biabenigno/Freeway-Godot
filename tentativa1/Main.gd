extends Node2D

const CARRO = preload("res://Carro.tscn")
const pista_rapida = [493, 329 , 165 , 272 , 439]
var score 

func _ready():
	score = 0
	$HUD/Ashley.hide()
	$HUD/Reset.hide()
	$HUD/Score.text = str(score)
	
func _on_Timer_timeout():
	var carro = CARRO.instantiate()
	add_child(carro)
	
	carro.position.x = -30
	carro.position.y = pista_rapida[randi()%len(pista_rapida)]
	
	carro.linear_velocity = Vector2(randf_range(400,430),0)

#func _on_Timer2_timeout():
#	var carro = CARRO.instantiate()
#	add_child(carro)
	
#	carro.position.x = 1300
#	carro.position.y = pista_rapida[randi()%len(pista_rapida)]
	
#	carro.linear_velocity = Vector2(-randf_range(400,430),0)

func _on_Galinha_pontuar():
	score+=1
	$HUD/Score.text = str(score)
	if score == 3:
		$Ganhou.play()
		$HUD/Ashley.show()
		$HUD/Reset.show()
		$Timer.stop()
		$Galinha.velocidade = 0
		$Tema.stop()

func _on_HUD_reset():
	score = 0;
	$HUD/Ashley.hide()
	$HUD/Reset.hide()
	$HUD/Score.text = "0"
	$Timer.start()
	#$Galinha.velocidade = 100
	$Tema.play()
