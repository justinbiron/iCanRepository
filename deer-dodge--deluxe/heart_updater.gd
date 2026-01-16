extends Node

# References to the heart bar containers
@onready var heart_bar_x = $heart_barX/HeartBarX # Adjust path as needed
@onready var heart_bar_y = $heart_barY/HBoxContainer  # Adjust path as needed

var previous_health_x: int = 5
var previous_health_y: int = 5

func _ready():
	# Initialize heart bars
	update_heart_bar(heart_bar_x, CarXHealth.health)
	update_heart_bar(heart_bar_y, CarYHealth.health)

func _process(_delta):
	# Check if health has changed for Car X
	if CarXHealth.health != previous_health_x:
		update_heart_bar(heart_bar_x, CarXHealth.health)
		previous_health_x = CarXHealth.health
	
	# Check if health has changed for Car Y
	if CarYHealth.health != previous_health_y:
		update_heart_bar(heart_bar_y, CarYHealth.health)
		previous_health_y = CarYHealth.health

func update_heart_bar(heart_bar: HBoxContainer, health: int):
	# Get all heart TextureRect children
	var hearts = heart_bar.get_children()
	
	# Update visibility of each heart based on health
	for i in range(hearts.size()):
		if hearts[i] is TextureRect:
			hearts[i].visible = (i < health)


func _on_quit_button_pressed() -> void:
	pass # Replace with function body.
