extends Node2D

var player_in := false

@export_multiline var text : String

@export var interactable : bool = false

@export_enum("Blank", "Up", "Down", "Left", "Right") var variation : int = 0

@onready var signs : Array = [preload("res://Assets/Signs/blank.png"), preload("res://Assets/Signs/up.png"), preload("res://Assets/Signs/down.png"), preload("res://Assets/Signs/left.png"), preload("res://Assets/Signs/right.png")]
# Called when the node enters the scene tree for the first time.
func _ready():
	$StaticBody2D/Sprite2D.texture = signs[variation]
	$Area2D/Interact.disabled = !interactable
	Global.interact.connect(interaction)

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_in = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_in = false

func interaction():
	if Global.can_control:
		if player_in:
			Global.reading.emit(text)
