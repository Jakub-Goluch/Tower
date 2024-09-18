extends Button

signal move_tomatoes
var tomatoes_moved = false
var click_ctr = 0

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")


func _ready():
	connect("pressed", btn_clicked)
	
	connect("mouse_entered", change_cursor)
	connect("mouse_exited", reset_cursor)
	
func btn_clicked():
	print("tomato signal")
	if click_ctr == 0:
		tomatoes_moved = true
		emit_signal("move_tomatoes")
		click_ctr += 1

func change_cursor():
	if !tomatoes_moved:
		print("tomato cursor change")
		Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
