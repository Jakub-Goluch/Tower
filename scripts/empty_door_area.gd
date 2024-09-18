extends Area2D

var enter_cursor = preload("res://assets/cursors/enter_door_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
var current_cursor
var in_area = false

func _ready() -> void:
	connect("mouse_entered", change_cursor)
	connect("mouse_exited", reset_cursor)

func _process(delta):
	if in_area:
		Input.set_custom_mouse_cursor(enter_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
	else:
		Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))


func change_cursor():
	print("change cursor to arrow!")
	in_area = true
	

func reset_cursor():
	in_area = false
	
