extends Node3D

@export var lane_distance: float = 1.9        # Distance between lanes (X axis)
@export var lane_count: int = 4                # Total number of lanes
@export var lane_move_speed: float = 7.0       # How fast the car slides sideways
@export var start_lane: int = 1                # Starting lane index (0 to lane_count - 1)
@export var lane_center_offset: float = 5    # Shifts all lanes left/right in world space
@export var start_z: float = -10               # Where the car starts on the Z axis
@export var z_offset: float = 2.0              # Shifts the whole lane system forward/backward
@export var ground_y: float = 2.3              # Y position where deer stops falling (road level)
@export var fall_speed: float = 9.8            # How fast the deer falls

var current_lane: int
var target_x: float = 0.0
var is_dropped: bool = false  # Track if this is a dropped deer

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
	# Only move forward if not dropped
	if not is_dropped:
		# --- Move forward automatically ---
		translate(Vector3(0, 0, (-global.forward_speed) * delta)/8.75)
		
		# --- Smoothly slide toward the target lane position ---
		var pos = global_transform.origin
		pos.x = move_toward(pos.x, target_x, lane_move_speed * delta)
		global_transform.origin = pos
		
		# --- Keep rotation fixed ---
		rotation_degrees = Vector3.ZERO
	else:
		# Apply gravity for dropped deer, but stop at ground level
		var pos = global_transform.origin
		if pos.y > ground_y:
			pos.y -= fall_speed * delta
			# Make sure we don't go below ground
			if pos.y < ground_y:
				pos.y = ground_y
			global_transform.origin = pos

func _input(event):
	if not is_dropped:  # Only allow controls if not dropped
		if event.is_action_pressed("DeerX_Left"):
			_move_left()
		elif event.is_action_pressed("DeerX_Right"):
			_move_right()
		elif event.is_action_pressed("DeerX_Drop"):
			_drop_deer()

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

func _drop_deer():
	# Create a duplicate of this deer
	var dropped_deer = self.duplicate()
	
	# Add it to the scene
	get_parent().add_child(dropped_deer)
	
	# Set its position to match current position
	dropped_deer.global_transform.origin = global_transform.origin
	
	# Mark it as dropped so it stops moving forward
	dropped_deer.is_dropped = true
	
	# Add collision detection for the dropped deer
	_setup_collision(dropped_deer)

func _setup_collision(deer):
	# Add Area3D for collision detection
	if not deer.has_node("HitArea"):
		var area = Area3D.new()
		area.name = "HitArea"
		deer.add_child(area)
		
		# Copy the existing CollisionShape3D to the Area3D
		var original_collision = deer.get_node_or_null("CollisionShape3D")
		if original_collision:
			var collision_copy = original_collision.duplicate()
			area.add_child(collision_copy)
		else:
			# Fallback: create a basic collision shape
			var collision_shape = CollisionShape3D.new()
			var shape = BoxShape3D.new()
			shape.size = Vector3(1, 2, 1)  # Adjust to match deer size
			collision_shape.shape = shape
			area.add_child(collision_shape)
		
		# Connect collision signal
		area.body_entered.connect(_on_deer_hit_car.bind(deer))

func _on_deer_hit_car(body, deer):
	# Check if the body is the car
	if body.has_method("take_damage") or body.name.contains("Car"):
		print("Deer hit the car!")
		
		# Deal damage to car
		if body.has_method("take_damage"):
			body.take_damage(1)
		
		# Remove the dropped deer
		deer.queue_free()
