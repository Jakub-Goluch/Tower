extends Node2D
@onready var statue_sound: AudioStreamPlayer2D = $StatueSound


func _ready() -> void:
	$LeverButton.connect("switch_lever", start_animation)
	if name == "LeverRight":
		$MainRoomKey.visible = false
	if name == "LeverLeft":
		$Door7_IN.visible = false
		
		
func start_animation():
	$AnimatedSprite2D.play("switch")
	statue_sound.play()
	await get_tree().create_timer(1.0).timeout
	$Statue.position.x -= 22.0
	
	if name == "LeverRight":
		$MainRoomKey.visible = true
	if name == "LeverLeft":
		$Door7_IN.visible = true
