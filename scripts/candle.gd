extends Node2D

@onready var point_light: PointLight2D = $Sprite2D/PointLight2D
@onready var win_sound: AudioStreamPlayer2D = $WinSound
var won = false

func _ready():
	$Sprite2D/CandleButton.connect("switch", turn_light)
	point_light.visible = false
	
func turn_light(name):
	if !won:
		point_light.visible = !point_light.visible
		#print("name of candle: " + name)

func turn_off():
	point_light.visible = false
	
func win():
	point_light.visible = true
	won = true
	win_sound.play()
