extends Area2D

var counter = 0
@onready var camera: Camera2D = %Camera2D
@onready var player: CharacterBody2D = %Player
var right_position: Vector2
var left_position: Vector2
var old_position: Vector2

func _ready():
	connect("body_entered", move_camera)
	right_position = Vector2(43.0 , 599.0) # elixir office
	left_position = Vector2(-179.0, 549.0) # main bedroom
	
func move_camera(body):
	print("player entered area!")
	counter += 1
	old_position = camera.global_position
	
	if(counter%2 != 0): # entering from left so move to right
		camera.position = left_position
	elif(counter%2==0): # entering from right so move to left
		camera.position = right_position
	
