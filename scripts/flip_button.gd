extends Button

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")

signal flip_page

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("pressed", signal_flip)
	connect("mouse_entered", change_cursor)
	connect("mouse_exited", reset_cursor)
	

func signal_flip():
	emit_signal("flip_page")

func change_cursor():
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
	
func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
