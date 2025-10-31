extends Node3D

@export var forward_speed: float = 0.0
@export var lane_distance: float = 1.9         # Distance between lanes (X axis)
@export var lane_count: int = 4                # Total number of lanes
@export var lane_move_speed: float = 7.0       # How fast the car slides sideways

@export var start_lane: int = 1                # Starting lane index (0 to lane_count - 1)
@export var lane_center_offset: float = -0.85    # Shifts all lanes left/right in world space

@export var start_z: float = 10.2               # Where the car starts on the Z axis
@export var z_offset: float = 0.0              # Shifts the whole lane system forward/backward

var current_lane: int
var target_x: float = 0.0

func _ready():
	# Clamp starting lane to valid range
	current_lane = clamp(start_lane, 0, lane_count - 1)
	_update_target_position()

	# Set starting position immediately
	var pos = global_transform.origin
	pos.x = target_x
	pos.z = start_z + z_offset
	global_transform.origin = pos

	# Lock rotation
	rotation_degrees = Vector3.ZERO

func _physics_process(delta: float) -> void:
	# --- Move forward automatically ---
	translate(Vector3(0, 0, -forward_speed * delta))

	# --- Smoothly slide toward the target lane position ---
	var pos = global_transform.origin
	pos.x = move_toward(pos.x, target_x, lane_move_speed * delta)
	global_transform.origin = pos

	# --- Keep rotation fixed ---
	rotation_degrees = Vector3.ZERO

func _input(event):
	if event.is_action_pressed("CarX_Left"):
		_move_left()
	elif event.is_action_pressed("CarX_Right"):
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
	# Center lanes around X = lane_center_offset
	var leftmost_x = lane_center_offset - ((lane_count - 1) * lane_distance) / 2.0
	target_x = leftmost_x + (current_lane * lane_distance)
