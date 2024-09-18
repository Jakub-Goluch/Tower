extends Node2D

var mouse_on = false

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")


func _on_area_2d_mouse_entered():
	mouse_on = true
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func _on_area_2d_mouse_exited():
	mouse_on = false
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
	
func _process(delta):
	if Input.is_action_just_pressed("left_mouse") and mouse_on:
		Events.item_picked.emit(self)
		Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7)) # reset cursor to normal
		queue_free()
	
