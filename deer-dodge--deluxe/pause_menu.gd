extends Control

func _ready():
	hide()
	print("Pause menu loaded")

func _input(event):
	print("Input detected: ", event)
	
	if event is InputEventKey and event.pressed:
		print("Key pressed: ", event.keycode)
		
		if event.keycode == KEY_ESCAPE:
			print("ESCAPE detected!")
			if visible:
				hide()
				get_tree().paused = false
			else:
				show()
				get_tree().paused = true
		
		elif event.keycode == KEY_Y:
			print("Y detected!")
			show()
			get_tree().paused = true

func _on_resume_pressed():
	hide()
	get_tree().paused = false
	print("Resume clicked")

func _on_quit_pressed():
	get_tree().quit()
