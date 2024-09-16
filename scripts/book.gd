extends Node2D

@onready var big_book: Sprite2D = $BigBook
var flag: bool = false

func _ready():
	$BookButton.connect("open_book", show_book)
	big_book.visible = false

func _process(float) -> void:
	if big_book.visible:
		$BigBook/CloseBookButton.connect("hide", hide_book)
	
func show_book():
	if !big_book.visible: # so btn doesnt click in the background when big book displayed
		big_book.visible = true

func hide_book():
	big_book.visible = false
