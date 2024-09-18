extends Node2D


func _ready() -> void:
	$LeverButton.connect("switch_lever", start_animation)

func start_animation():
	$AnimatedSprite2D.play("switch")
	await get_tree().create_timer(1.0).timeout
	$Statue.position.x -= 20
