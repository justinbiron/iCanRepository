extends Node
var time_post_damageX: float = 0.0
var time_accumulator3: float = 0.0

# In _physics_process:
func _physics_process(delta: float) -> void:
	# Update time counter every 0.1 seconds
	time_accumulator3 += delta
	if time_accumulator3 >= 0.1:
		time_post_damageX += 0.1
		time_accumulator3 -= 0.1
