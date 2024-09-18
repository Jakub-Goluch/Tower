extends Button

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
signal switch_lever
var switched = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("pressed", lever_pressed)

	connect("mouse_entered", change_cursor)
	connect("mouse_exited", reset_cursor)

func lever_pressed():
	if !switched:
		emit_signal("switch_lever")
		switched = true

func change_cursor():
	if !switched: # can only switch lever once
		Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
