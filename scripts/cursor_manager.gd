extends Node2D

var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var zoom_cursor = preload("res://assets/cursors/zoom_cursor.png")
var flag_cursor_change = false

var current_cursor

func _ready():
	pass
	
func set_hand_cursor():
	print("setting hand cursor")
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(8, 8))
	
func set_zoom_cursor():
	Input.set_custom_mouse_cursor(zoom_cursor, Input.CURSOR_ARROW, Vector2(8, 8))

func reset_cursor():
	print("resetting cursor")
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(8, 8))
