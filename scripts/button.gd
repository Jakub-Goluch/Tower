extends Button

signal switch
var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")


func _ready():
	connect("pressed", light_change)
	
	connect("mouse_entered", change_cursor)
	connect("mouse_exited", reset_cursor)
	
func light_change():
	#print("click")
	if self.name == "CandleButton":
		emit_signal("switch", self.get_parent().get_parent().name)
	else:
		emit_signal("switch", self.get_parent().name)

func change_cursor():
	#print("lantern/candle cursor change")
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))
