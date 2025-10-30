extends Node3D

@export var forward_speed: float = 10.0
@export var turn_speed: float = 2.5

func _physics_process(delta: float) -> void:
	# --- Move forward automatically ---
	translate(-transform.basis.z * forward_speed * delta)

	# --- Handle turning ---
	var turn_input = Input.get_action_strength("CarX_Right") - Input.get_action_strength("CarX_Left")
	rotation.y -= turn_input * turn_speed * delta
