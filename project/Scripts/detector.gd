extends Area2D

@export var layer_of_update : int

var is_occupied = false

#Shows red light layer when no object, hides it to show green when there is
func _on_body_entered(body):
	if body is RigidBody2D:
		$"../Ding".play()
		is_occupied = true
		$"../../TileMap".set_layer_enabled(layer_of_update, false)


func _on_body_exited(body):
	if body is RigidBody2D:
		is_occupied = true
		$"../../TileMap".set_layer_enabled(layer_of_update, true)
