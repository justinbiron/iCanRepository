extends CanvasLayer

# References to health nodes
@onready var car_x_health = CarXHealth
@onready var car_y_health = CarYHealth

# UI Elements (create these in your CanvasLayer)

@onready var winner_label = $WinnerLabel  # Label showing who won
@onready var restart_button = $RestartButton  # Button to restart
@onready var quit_button = $QuitButton  # Button to quit

func _ready():
	# Hide end screen at start
	visible = false

func _process(_delta):
	# Check if either car has lost all health
	if car_x_health.health <= 0:
		show_end_screen("Car Y Wins!")
	elif car_y_health.health <= 0:
		show_end_screen("Car X Wins!")

func show_end_screen(winner_text: String):
	# Show the end screen
	visible = true
	winner_label.text = winner_text
	
	# Stop processing this check
	set_process(false)

func _on_restart_button_pressed():
	# Restart the current scene
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	# Quit to main menu or quit game
	get_tree().change_scene_to_file("res://main_menu.tscn")  # Adjust path
	# Or to quit the game entirely:
	# get_tree().quit()
