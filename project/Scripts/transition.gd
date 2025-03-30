extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Animation.play_backwards("enter")

func change_scene(target : String, color : Color):
	Global.can_control = false
	$ColorRect.color = color
	$Animation.play("enter")
	await $Animation.animation_finished
	get_tree().change_scene_to_file(target)
	Global.can_control = true
	$Animation.play_backwards("enter")
