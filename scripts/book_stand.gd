extends Node2D

signal open_book
var zoom_cursor = preload("res://assets/cursors/zoom_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
var current_cursor

var book_open

func _ready():
	# to open big book -----------------
	$StandButton.connect("pressed", open)
	# -----------------------------------
	$StandButton.connect("mouse_entered", change_cursor)
	$StandButton.connect("mouse_exited", reset_cursor)
	book_open = false
	$BookCanvasLayer.hide()
	
	# to close big book ----------------
	$BookCanvasLayer/Book/AnimatedSprite2D/Sprite2D2/CloseBookButton.connect("hide", close)
	# -----------------------------------


	
func _process(delta):
	if book_open:
		Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
	
func open():
	$BookCanvasLayer.show()
	book_open = true
	$BookCanvasLayer/Book/AnimatedSprite2D/FlipPage/FlipButton.mouse_filter = 0
	$BookCanvasLayer/Book/AnimatedSprite2D/FlipPageBack/FlipButtonBack.mouse_filter = 0
	$BookCanvasLayer/Book/AnimatedSprite2D/Sprite2D2/CloseBookButton.mouse_filter = 0

func close():
	$BookCanvasLayer.hide()
	$BookCanvasLayer/Book/AnimatedSprite2D/FlipPage/FlipButton.mouse_filter = 1
	$BookCanvasLayer/Book/AnimatedSprite2D/FlipPageBack/FlipButtonBack.mouse_filter = 1
	$BookCanvasLayer/Book/AnimatedSprite2D/Sprite2D2/CloseBookButton.mouse_filter = 1
	book_open = false
	
func change_cursor():
	if !book_open:
		current_cursor = zoom_cursor
		Input.set_custom_mouse_cursor(current_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func reset_cursor():
	current_cursor = normal_cursor
	Input.set_custom_mouse_cursor(current_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
