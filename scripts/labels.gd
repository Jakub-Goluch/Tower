extends Node

var labels_array

func _ready():
	labels_array = [$Label, $Label2, $Label3, $Label4]
	labels_array[0].visible = true
	
	for i in range(1, 4):
		labels_array[i].visible = false
		
	
func change_label(page):
	labels_array[page].visible = false
	labels_array[page + 1].visible = true
