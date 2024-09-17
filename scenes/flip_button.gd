extends Button

signal flip_page

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("pressed", signal_flip)

func signal_flip():
	emit_signal("flip_page")
