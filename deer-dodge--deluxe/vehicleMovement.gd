extends RigidBody3D

var speed = 10.0  # how strong the force is

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("Left"):
		direction.x -= 50
	if Input.is_action_pressed("Right"):
		direction.x += 50

	# Apply force sideways
	if direction != Vector3.ZERO:
		apply_central_force(direction * speed)
