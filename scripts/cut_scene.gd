extends Node2D
@onready var animated_sprite: AnimatedSprite2D = $CutScenePlayer/Player/AnimatedSprite2D
@onready var animated_sprite_hero: AnimatedSprite2D = $CutScenePlayer/KnightHero/AnimatedSprite2D


func _ready():
	#move_player()
	#cry_player()
	closing_scene()
	
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

func closing_scene():
	animated_sprite.flip_h = true
	animated_sprite_hero.flip_h = true
	animated_sprite.play("walk")
	animated_sprite_hero.play("run")
	await get_tree().create_timer(4.2).timeout
	animated_sprite_hero.play("fall")
	await get_tree().create_timer(0.7).timeout
	animated_sprite.play("wait")
	await get_tree().create_timer(5.6).timeout
	animated_sprite.play("idle")
