extends Control


func _on_play_pressed():
	$Audio.play()
	Transition.change_scene("res://Scenes/main.tscn", Color.hex(292634))


func _on_credits_pressed() -> void:
	$Audio.play()
	Transition.change_scene("res://Scenes/credits.tscn", Color.hex(292634))
