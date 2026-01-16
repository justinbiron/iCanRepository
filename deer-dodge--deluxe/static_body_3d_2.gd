extends StaticBody3D

# Length of one road segment
const ROAD_LENGTH = 47.056

# Reference point (usually the camera or player)
@onready var camera: Camera3D

# Distance behind camera before repositioning
# This should be at least the road length to ensure cars never lose ground
const REPOSITION_DISTANCE = ROAD_LENGTH + 10.0

func _ready():
	# Find the camera - adjust the path to match your scene structure
	camera = get_viewport().get_camera_3d()

func _process(_delta):
	if camera == null:
		return
	
	# Check if this road segment is behind the camera
	var distance_from_camera = global_position.z - camera.global_position.z
	
	# If road is far enough behind, move it forward
	if distance_from_camera > REPOSITION_DISTANCE:
		# Move it 2 road lengths forward (to go in front of the other segment)
		global_position.z -= ROAD_LENGTH * 4
		
		# Force collision shape update for StaticBody3D
		for child in get_children():
			if child is CollisionShape3D:
				child.disabled = true
				child.disabled = false
