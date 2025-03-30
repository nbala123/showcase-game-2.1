extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.comp_reading.connect(trigger_comp_reading)
	Global.interact.connect(empty)


func trigger_comp_reading(text : String):
	%Text.text = text
	$Animation.play("enter")
	$Open.play()
	Global.can_control = false
	await Global.interact
	$Animation.play_backwards("enter")
	$Close.play()
	await get_tree().create_timer(.3).timeout
	Global.can_control = true


func empty():
	pass
