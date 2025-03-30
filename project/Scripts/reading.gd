extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.reading.connect(trigger_reading)
	Global.interact.connect(empty)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func trigger_reading(text : String):
	%Text.set("theme_override_font_sizes/normal_font_size", 48)
	%Text.text = "[center]" + text + "[/center]"
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
