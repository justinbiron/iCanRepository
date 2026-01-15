extends Node

var carY_lane = 1

func _input(event):
	if event.is_action_pressed("CarY_Left") and carY_lane > 0:
		carY_lane -= 1
	elif event.is_action_pressed("CarY_Right") and carY_lane < 3:
		carY_lane += 1
	print("CARY: "+ str(carY_lane))
