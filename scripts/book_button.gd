extends Button

signal open_book
var zoom_cursor = preload("res://assets/cursors/zoom_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
var current_cursor

var book_open

func _ready():
	connect("pressed", open)
	
	connect("mouse_entered", change_cursor)
	connect("mouse_exited", reset_cursor)
	book_open = false
	
func _process(delta):
	if book_open:
		Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(8, 8))
	
func open():
	emit_signal("open_book")
	book_open = true

func change_cursor():
	if !book_open:
		current_cursor = zoom_cursor
		Input.set_custom_mouse_cursor(current_cursor, Input.CURSOR_ARROW, Vector2(8, 8))

func reset_cursor():
	current_cursor = normal_cursor
	Input.set_custom_mouse_cursor(current_cursor, Input.CURSOR_ARROW, Vector2(8, 8))
