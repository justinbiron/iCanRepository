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
				$VBoxContainer/Resume.release_focus()
			else:
				show()
				get_tree().paused = true
				$VBoxContainer/Resume.grab_focus()
		
		elif event.keycode == KEY_Y:
			print("Y detected!")
			if not visible:
				show()
				get_tree().paused = true
				await get_tree().create_timer(0.2).timeout
				$VBoxContainer/Resume.grab_focus()

func _on_resume_pressed():
	$VBoxContainer/Resume.release_focus()
	hide()
	get_tree().paused = false
	print("Resume clicked")

func _on_quit_pressed():
	get_tree().quit()
	
func _on_restart_pressed():
	$VBoxContainer/Resume.release_focus()
	CarXHealth.health = 5
	CarYHealth.health = 5
	get_tree().paused = false
	get_tree().reload_current_scene()
	print("Resyytart clicked")
