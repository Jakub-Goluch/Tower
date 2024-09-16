extends Button

signal switch

func _ready():
	connect("pressed", light_change)
	
func light_change():
	print("click")
	emit_signal("switch")
