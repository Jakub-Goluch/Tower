extends Button

signal flip_page_back

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("pressed", signal_flip_back)
	
func signal_flip_back():
	emit_signal("flip_page_back")
