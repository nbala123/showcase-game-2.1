extends Area2D

var player_in = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.interact.connect(interaction)


func _on_body_entered(body):
	if body.name == "Player":
		player_in = true


func _on_body_exited(body):
	if body.name == "Player":
		player_in = false

func interaction():
	if Global.can_control:
		if player_in:
			if !$"../key_water".first_interaction:
				$Open.play()
				$"..".set_layer_enabled(4, false)
