extends AnimatedSprite2D

var page = 0
@onready var book_text: Node2D = $"../BookText"

func _ready():
	$FlipPage/FlipButton.connect("flip_page", change_page)
	$FlipPageBack/FlipButtonBack.connect("flip_page_back", back_page)
		
func change_page():
	if page < 3:
		book_text.change_text()
		play("flip_page")
		page += 1
	
func back_page():
	if page > 0:
		book_text.change_text_back()
		play_backwards("flip_page")
		page -= 1
