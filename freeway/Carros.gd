extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var cordocarro = $AnimatedSprite2D.frame.get_animation_names()
	print(cordocarro)
	$AnimatedSprite2D.animation = cordocarro[randi() % cordocarro.size()]
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
