extends Node2D

@onready var book_stand: Node2D = $BookStand
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var book_text: Node2D = $BookText

var flag: bool = false

func _ready():
	$BookStand/StandButton.connect("open_book", show_book)
	$AnimatedSprite2D/Sprite2D2/CloseBookButton.connect("hide", hide_book)
	animated_sprite.visible = false
	book_text.visible = false

	$AnimatedSprite2D.global_position = %Camera2D.global_position
	$BookText.global_position = %Camera2D.global_position
	
func show_book():
	print("opening book")
	if !animated_sprite.visible: # so btn doesnt click in the background when big book displayed
		animated_sprite.visible = true
		book_text.visible = true
		book_stand.visible = false

func hide_book():
	animated_sprite.visible = false
	book_text.visible = false
	book_stand.visible = true
