extends Node2D
@onready var animated_sprite: AnimatedSprite2D = $CutScenePlayer/Player/AnimatedSprite2D


func _ready():
	move_player()
	cry_player()
	
func move_player():
	animated_sprite.play("wait")
	await get_tree().create_timer(26.0).timeout
	animated_sprite.flip_h = true
	animated_sprite.play("walk")

func cry_player():
	await get_tree().create_timer(16.0).timeout
	animated_sprite.play("idle")
	await get_tree().create_timer(3.0).timeout
	animated_sprite.play("wait")
