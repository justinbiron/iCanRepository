extends Node

var DeerX_lane = 2

func _input(event):
	if event.is_action_pressed("DeerY_Left") and DeerX_lane > 0:
		DeerX_lane -= 1
	elif event.is_action_pressed("DeerY_Right") and DeerX_lane < 3:
		DeerX_lane += 1
	#print("DEERX: "+ str(DeerX_lane))
