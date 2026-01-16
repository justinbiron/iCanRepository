extends Node
var time_post_damageY: float = 0.0
var time_accumulator4: float = 0.0

# In _physics_process:
func _physics_process(delta: float) -> void:
	# Update time counter every 0.1 seconds
	time_accumulator4 += delta
	if time_accumulator4 >= 0.1:
		time_post_damageY += 0.1
		time_accumulator4 -= 0.1
