extends Area2D

var player_in = false

@export var next_scene : String


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_body_entered(body):
	if body.name == "Player":
		Transition.change_scene(next_scene, Color.hex(170e19))


func _on_body_exited(body):
	if body.name == "Player":
		player_in = false
