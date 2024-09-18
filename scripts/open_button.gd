extends Button

signal open
var drawer_open = false

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("pressed", open_drawer)
	
	connect("mouse_entered", change_to_hand)
	connect("mouse_exited", reset_cursor)

func open_drawer():
	emit_signal("open")
	drawer_open = true

func change_to_hand():
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(5, 7))

func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
