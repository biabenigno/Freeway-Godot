extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var animation_names = $AnimatedSprite2D.frame.get_animation_names()
	var selected_animation = animation_names[randi()%len(animation_names)]
	$AnimatedSprite2D.animation = selected_animation
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
