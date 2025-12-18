extends Node3D

func _physics_process(delta: float) -> void:
	# Move forward automatically
	translate(Vector3(0, (-global.forward_speed * delta)/125, 0))
