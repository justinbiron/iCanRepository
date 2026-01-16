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
				$VBoxContainer/Resume.grab_focus()
			else:
				show()
				get_tree().paused = true
				$VBoxContainer/Resume.grab_focus()
		
		elif event.keycode == KEY_Y:
			print("Y detected!")
			show()
			get_tree().paused = true
			$VBoxContainer/Resume.grab_focus()

func _on_resume_pressed():
	hide()
	get_tree().paused = false
	print("Resume clicked")

func _on_quit_pressed():
	get_tree().quit()
	
func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	print("Restart clicked")
