extends AnimatedSprite2D

var page = 0
@onready var book_text: Node2D = $"../BookText"
@onready var flip_page_sound: AudioStreamPlayer2D = $FlipPageSound

func _ready():
	$FlipPage/FlipButton.connect("flip_page", change_page)
	$FlipPageBack/FlipButtonBack.connect("flip_page_back", back_page)
		
func change_page():
	if page < 3:
		book_text.change_text()
		flip_page_sound.play()
		play("flip_page")
		page += 1
	
func back_page():
	if page > 0:
		book_text.change_text_back()
		flip_page_sound.play()
		play_backwards("flip_page")
		page -= 1
