extends Node

var correct_order # int array
var current_order # int array
var lanterns # node array
var correct_ptr
var won: bool

func _ready():
	correct_order = [1, 3, 2, 3, 2, 2, 1]
	current_order = Array()
	$Lantern/Button.connect("switch", register_click)
	$Lantern2/Button.connect("switch", register_click)
	$Lantern3/Button.connect("switch", register_click)
	lanterns = [$Lantern, $Lantern2, $Lantern3]
	correct_ptr = 0 # mark where in correct array we are
	

func register_click(name):
	#if which.getparent().getname() == "Lantern":
	if !won:
		print(name)
		for i in range(0, 3):
			if name == lanterns[i].name:
				current_order.append(i+1) # as lanterns indexed from 1
				
		if current_order.size() > 0:
			if current_order[current_order.size()-1] != correct_order[correct_ptr]:
				current_order.clear() # mistake -> reset array
				correct_ptr = 0
				for x in lanterns:
					x.turn_off() # switch off light on mistake
			else: # right element clicked
				print("curr: " + str(current_order[current_order.size()-1]))
				print("corr: " + str(correct_order[correct_ptr]))
				correct_ptr += 1 # go to next 
			
		if current_order == correct_order:
			print("CORRECT ORDER CONGRATS")
			won = true
			for x in lanterns:
				x.win() # switch on all lanterns
