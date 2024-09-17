extends Button

signal switch
signal register

func _ready():
	connect("pressed", light_change)
	
func light_change():
	print("click")
	emit_signal("switch", self.get_parent().name)
