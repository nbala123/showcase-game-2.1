extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	if body.name == "Player":
		Transition.change_scene("res://Scenes/lab.tscn", Color.hex(292634))
