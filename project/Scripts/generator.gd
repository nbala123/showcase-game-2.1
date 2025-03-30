extends RigidBody2D

@export var reset_position : Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.reset.connect(reset)

func reset():
	position = reset_position
