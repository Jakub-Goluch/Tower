extends Node2D

@onready var tomato_key: Node2D = $TomatoKey

func _ready():
	$TomatoButton.connect("move_tomatoes", change_position)
	tomato_key.visible = false
	
	
func change_position():
	$Sprite2D.position.x -= 20 # move tomato box to the left -> reveal key
	tomato_key.visible = true
