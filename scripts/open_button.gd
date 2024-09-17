extends Button

signal open
var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
var drawer_open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("pressed", open_drawer)
	
	connect("mouse_entered", change_cursor)
	connect("mouse_exited", reset_cursor)

func open_drawer():
	emit_signal("open")
	drawer_open = true
	reset_cursor()
	
func change_cursor():
	if !drawer_open:
		Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(8, 8))

func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(8, 8))
