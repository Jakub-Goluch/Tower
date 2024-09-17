extends Node2D

var mouse_on = false

func _on_area_2d_mouse_entered():
	mouse_on = true


func _on_area_2d_mouse_exited():
	mouse_on = false
	
func _process(delta):
	if Input.is_action_just_pressed("left_mouse") and mouse_on:
		Events.item_picked.emit(self)
