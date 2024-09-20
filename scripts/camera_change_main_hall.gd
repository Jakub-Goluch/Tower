extends Area2D

var counter = 0
@onready var camera: Camera2D = %Camera2D
@onready var player: CharacterBody2D = %Player
var right_position: Vector2
var left_position: Vector2
var old_position: Vector2

func _ready():
	connect("body_entered", move_camera)
	right_position = Vector2(110.0 , 446.0) # elixir office
	left_position = Vector2(-135.0, 435.0) # main bedroom
	
func move_camera(body):
	print("player entered area!")
	counter += 1
	old_position = camera.global_position
	
	if(counter%2 != 0): # entering from left so move to right
		camera.position = right_position
		camera.zoom = Vector2(4.0, 4.0)
	elif(counter%2==0): # entering from right so move to left
		camera.position = left_position
		camera.zoom = Vector2(6.0, 6.0)
	
