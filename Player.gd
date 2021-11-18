extends KinematicBody

# physics
var move_speed : float = 3.0

# cam look
var min_look_angle : float = -90.0
var max_look_angle : float = 90.0
var look_sensitivity : float = 5.0

# vectors
var velocity : Vector3 = Vector3()
var mouse_delta : Vector2 = Vector2()

# components
onready var camera : Camera = get_node("Camera")

func _ready():
	# hide and lock the mouse cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	# reset x and z velocity
	velocity.x = 0
	velocity.z = 0
	
	var input = Vector2()
	
	# movement inputs
	if Input.is_action_pressed("move_forward"):
		input.y -= 1
	if Input.is_action_pressed("move_backward"):
		input.y += 1
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	if Input.is_action_pressed("move_right"):
		input.x += 1

	input = input.normalized()
	
	# get the forward and right directions
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	
	var relative_direction = forward * input.y + right * input.x

	# set the velocity
	velocity.x = relative_direction.x * move_speed
	velocity.z = relative_direction.z * move_speed
	
	# move the player
	velocity = move_and_slide(velocity, Vector3.UP)

func _process(delta):
	# rotate the camera along the x axis
	camera.rotation_degrees.x -= mouse_delta.y * look_sensitivity * delta
	
	# clamp camera x rotation axis
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, min_look_angle, max_look_angle)
	
	# rotate the player along their y axis
	rotation_degrees.y -= mouse_delta.x * look_sensitivity * delta
	
	mouse_delta = Vector2()
	
func _input(event):
	if event is InputEventMouseMotion:
		mouse_delta = event.relative
