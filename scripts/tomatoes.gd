extends Node2D

@onready var tomato_key: Node2D = $TomatoKey
@onready var box_sound: AudioStreamPlayer2D = $BoxSound
@onready var tomato_button = $TomatoButton

func _ready():
	$TomatoButton.connect("move_tomatoes", change_position)
	tomato_key.visible = false
	
	
func change_position():
	$Sprite2D.position.x -= 20 # move tomato box to the left -> reveal key
	tomato_key.visible = true
	tomato_button.queue_free()
	box_sound.play()
	
