extends Area2D

@onready var detectors := [$"../detectors/detector1", $"../detectors/detector2", $"../detectors/detector3"]

var player_in := false

var all := false

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.interact.connect(interaction)

func _physics_process(_delta):
	if detectors[0].is_occupied and detectors[1].is_occupied and detectors[2].is_occupied:
		all = true
	else:
		all = false

func interaction():
	if player_in:
		if all:
			$"../TileMap".set_layer_enabled(2, false)
			Transition.change_scene("res://Scenes/hall.tscn", Color.hex(170e19))



func _on_body_entered(body):
	if body.name == "Player":
		player_in = true


func _on_body_exited(body):
	if body.name == "Player":
		player_in = false
