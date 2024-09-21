extends Button

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")

signal hide

func _ready():
	connect("pressed", close_book)
	connect("mouse_entered", change_cursor)
	connect("mouse_exited", reset_cursor)
	
	
func close_book():
	emit_signal("hide")

func change_cursor():
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
	
func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
