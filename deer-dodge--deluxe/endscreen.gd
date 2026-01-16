extends CanvasLayer

# References to health nodes
@onready var car_x_health = CarXHealth
@onready var car_y_health = CarYHealth
@onready var winner_label = $WinnerLabel  # Label showing who won

var game_ended = false  # Flag to prevent checking after game ends

func _ready():
	hide()
	game_ended = false  # Reset flag when scene loads

func _process(_delta):
	# Only check if game hasn't ended yet
	if game_ended:
		return
		
	# Check if either car has lost all health
	if car_x_health.health <= 0:
		get_tree().paused = true
		show_end_screen("PLAYER 2 WINS!")
		$VBoxContainer/restartend.grab_focus()
	elif car_y_health.health <= 0:
		get_tree().paused = true
		show_end_screen("PLAYER 1 WINS!")
		$VBoxContainer/restartend.grab_focus()

func show_end_screen(winner_text: String):
	# Show the end screen
	show()
	winner_label.text = winner_text
	game_ended = true
	
	# Stop processing this check
	set_process(false)

func _on_backmainmenu_pressed():
	get_tree().quit()
	
func _on_restartend_pressed():
	# IMPORTANT: Reset health values before restarting
	CarXHealth.health = 5
	CarYHealth.health = 5
	
	# Unpause and restart
	get_tree().paused = false
	get_tree().reload_current_scene()
	print("Restart clicked")

func _on_quit_button_pressed() -> void:
	pass # Replace with function body.
