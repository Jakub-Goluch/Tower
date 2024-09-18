extends Button

signal hide

func _ready():
	connect("pressed", close_book)

	
func close_book():
	emit_signal("hide")
