extends Area2D

var player_in = false

@export var next_scene : String
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.interact.connect(interaction)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interaction():
	if player_in:
		Transition.change_scene(next_scene, Color.hex(170e19))




func _on_body_entered(body):
	if body.name == "Player":
		player_in = true


func _on_body_exited(body):
	if body.name == "Player":
		player_in = false
