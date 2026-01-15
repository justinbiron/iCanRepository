extends Label

var elapsed_time: float = 0.0
var display_speed: float = 10.0  # Multiplier for visual speed (3x faster display)

func _ready():
	# Start counting from when the game begins
	elapsed_time = 0.0

func _process(delta):
	# Accumulate actual time
	elapsed_time += delta
	
	# Calculate display time (faster than real time for visual effect)
	var display_time = elapsed_time * display_speed
	
	# Display as a single growing number (with 2 decimal places)
	text = "%.2f" % display_time

# Optional: Get the actual elapsed time
func get_actual_time() -> float:
	return elapsed_time
