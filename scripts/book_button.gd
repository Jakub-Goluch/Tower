extends Button

signal open_book

func _ready():
	connect("pressed", open)
	
func open():
	emit_signal("open_book")
