extends Node

var DeerY_lane = 1

func _input(event):
	if event.is_action_pressed("DeerY_Left") and DeerY_lane > 0:
		DeerY_lane -= 1
	elif event.is_action_pressed("DeerY_Right") and DeerY_lane < 3:
		DeerY_lane += 1
	print("DEERY: "+ str(DeerY_lane))
