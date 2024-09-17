extends Button

signal switch

func _ready():
	connect("pressed", change_light)
	
func change_light():
	emit_signal("switch")
	
