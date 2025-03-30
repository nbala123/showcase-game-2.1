extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func popup(image_path : String, header : String, item : String):
	Global.can_control = false
	$Audio.play()
	await get_tree().create_timer(1).timeout
	$Panel/item_image.texture = load(image_path)
	$Panel/VBoxContainer/header.text = header
	$Panel/VBoxContainer/item.text = item
	$Animation.play("enter")
	Global.can_control = true
	await get_tree().create_timer(5).timeout
	$Animation.play_backwards("enter")
