extends Button


func _ready() -> void:
	connect("mouse_entered", change_cursor)
	connect("mouse_exited", reset_cursor)

func change_cursor():
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
