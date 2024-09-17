extends Button

signal open

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("pressed", open_drawer)


func open_drawer():
	emit_signal("open")
	
