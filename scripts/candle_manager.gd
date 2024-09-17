extends Node

var correct_order # int array
var current_order # int array
var candles # node array
var correct_ptr
var won: bool

func _ready():
	correct_order = [3, 4, 2, 5]
	current_order = Array()

	$Candle1/Sprite2D/CandleButton.connect("switch", register_click)
	$Candle2/Sprite2D/CandleButton.connect("switch", register_click)
	$Candle3/Sprite2D/CandleButton.connect("switch", register_click)
	$Candle4/Sprite2D/CandleButton.connect("switch", register_click)
	$Candle5/Sprite2D/CandleButton.connect("switch", register_click)
	
	candles = [$Candle1, $Candle2, $Candle3, $Candle4, $Candle5]
	correct_ptr = 0 # mark where in correct array we are
	

func register_click(name):
	#if which.getparent().getname() == "Lantern":
	if !won:
		print(name)
		for i in range(0, 5):
			if name == candles[i].name:
				current_order.append(i+1) # as lanterns indexed from 1
				
		if current_order.size() > 0:		
			if current_order[current_order.size()-1] != correct_order[correct_ptr]:
				current_order.clear() # mistake -> reset array
				correct_ptr = 0
				for x in candles:
					x.turn_off() # switch off light on mistake
			else: # right element clicked
				print("curr: " + str(current_order[current_order.size()-1]))
				print("corr: " + str(correct_order[correct_ptr]))
				correct_ptr += 1 # go to next 
			
		if current_order == correct_order:
			print("CORRECT ORDER CONGRATS")
			won = true
			for x in candles:
				x.win() # switch on all lanterns
