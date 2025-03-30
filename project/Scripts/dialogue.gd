extends CanvasLayer

func _ready():
	#Hide panel, connect trigger and progression signalss
	Global.dialogue.connect(trigger_dialogue)
	Global.interact.connect(empty)
#Dialogue main body function



func trigger_dialogue(dialogue : PackedStringArray):
	$Animation.play("enter")
	#REPLACE: Get appropriate dialogue
	var source = dialogue
	#Set controlability to false
	Global.can_control = false
	#For every part in dialogue, show to user, wait for prrgression of dialogue
	for say in source:
		%Text.visible_ratio = 0.0
		var typing = create_tween()
		%Text.text = say
		$Type.play()
		typing.tween_property(%Text, "visible_ratio", 1.0, say.length()/20.0)
		await typing.finished
		$Type.stop()
		await Global.interact
	$Animation.play_backwards("enter")
	#Re-allow controls
	await get_tree().create_timer(.2).timeout
	Global.can_control = true




#EMPTY THROWAWAY FUNCTION
func empty():
	pass
