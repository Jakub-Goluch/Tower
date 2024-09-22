extends Area2D

var counter = 0
@onready var camera: Camera2D = %Camera2D
@onready var player: CharacterBody2D = %Player
#var right_position: Vector2
var left_position: Vector2
#var old_position: Vector2

func _ready():
	connect("body_entered", move_camera)
	#right_position = Vector2(108.0 , 464.0) # elixir office
	left_position = Vector2(-169.0, 423.0) # main bedroom
	
func move_camera(body):
	#print("player entered area!")
	#counter += 1
	#old_position = camera.global_position
	
	print("moving LEFT")
	camera.position = left_position
