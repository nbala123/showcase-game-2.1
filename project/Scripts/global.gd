extends Node

var can_control : bool = true

signal dialogue(dialogue : PackedStringArray)
signal reading(text : String)
signal comp_reading(text : String)

signal interact
signal reset

func _input(event):
	if event.is_action_pressed("interact"):
		emit_signal("interact")
	elif event.is_action_pressed("reset"):
		emit_signal("reset")
	


 
