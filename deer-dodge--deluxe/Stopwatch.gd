extends Node
# At the top with your other variables:
var time: float = 0.0
var time_accumulator: float = 0.0
@onready var time_label = $CanvasLayer2/tim

# In _physics_process:
func _physics_process(delta: float) -> void:
	# Update time counter every 0.1 seconds
	time_accumulator += delta
	if time_accumulator >= 0.1:
		time += 0.1
		time_accumulator -= 0.1
		print ("Time: ",time)

	
	# ... rest of your code
