extends Area2D

var player_in := false

@export_multiline var dialogue : PackedStringArray

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
			Global.dialogue.emit(dialogue)
