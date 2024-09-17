extends Node2D

var labels
var page = 0

func _ready():
	labels = [$Label, $Label2, $Label3, $Label4]
	labels[0].visible = true
	
	for i in range(1,4):
		labels[i].visible = false
	
func change_text():
	labels[page].visible = false
	page += 1
	await get_tree().create_timer(0.8).timeout
	labels[page].visible = true

func change_text_back():
	labels[page].visible = false
	page -= 1
	await get_tree().create_timer(0.8).timeout
	labels[page].visible = true
