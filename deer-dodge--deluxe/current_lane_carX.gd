extends Node

var carX_lane = 2

func _input(event):
	if event.is_action_pressed("CarX_Left") and carX_lane > 0:
		carX_lane -= 1
	elif event.is_action_pressed("CarX_Right") and carX_lane < 3:
		carX_lane += 1
	#print("CARX: "+ str(carX_lane))
