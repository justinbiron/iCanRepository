extends Node3D

@export var lane_distance: float = 1.95         # Distance between lanes
@export var lane_count: int = 4                # Total number of lanes
@export var lane_move_speed: float = 7.0       # How fast the car slides sideways

@export var start_lane: int = 1                # Starting lane index (0 to lane_count - 1)
@export var lane_center_offset: float = 4.85   # Shifts all lanes left/right in world space
@export var z_offset: float = 5.55              # Shifts car forward/backward in world space

@export var current_lane: int
var target_x: float = 0.0

func _ready():
	# Clamp the starting lane to stay within range
	current_lane = clamp(start_lane, 0, lane_count - 1)
	_update_target_position()

	# Set the car’s starting position immediately (no sliding)
	var pos = global_transform.origin
	pos.x = target_x
	pos.z += z_offset   # Apply Z offset
	global_transform.origin = pos

	# Lock rotation
	rotation_degrees = Vector3.ZERO

func _physics_process(delta: float) -> void:
	# --- Move forward automatically ---
	translate(Vector3(0, 0, -global.forward_speed * delta))

	# --- Smoothly slide toward the target lane position ---
	var pos = global_transform.origin
	pos.x = move_toward(pos.x, target_x, lane_move_speed * delta)
	global_transform.origin = pos

	# --- Prevent rotation (stay perfectly straight) ---
	rotation_degrees = Vector3.ZERO

func _input(event):
	if event.is_action_pressed("CarY_Left"):
		_move_left()
	elif event.is_action_pressed("CarY_Right"):
		_move_right()

func _move_left():
	if current_lane > 0:
		current_lane -= 1
		_update_target_position()

func _move_right():
	if current_lane < lane_count - 1:
		current_lane += 1
		_update_target_position()

func _update_target_position():
	# Center lanes around lane_center_offset
	var leftmost_x = lane_center_offset - ((lane_count - 1) * lane_distance) / 2.0
	target_x = leftmost_x + (current_lane * lane_distance)
