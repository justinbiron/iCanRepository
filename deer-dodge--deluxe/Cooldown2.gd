extends Node
# At the top with your other variables:
var time2: float = 4.0
var time_accumulator2: float = 0.0
@onready var time_label2 = $CanvasLayer2/tim

# In _physics_process:
func _physics_process(delta: float) -> void:
	# Update time counter every 0.1 seconds
	time_accumulator2 += delta
	if time_accumulator2 >= 0.1:
		time2 -= 0.1
		time_accumulator2 -= 0.1
		#print ("Time2: ", time2)

	
	# ... rest of your code
