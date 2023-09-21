extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var mouse_sens:float = 0.3
var camera_anglev:float = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

signal smash(target)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		var changev=-event.relative.x*mouse_sens
		camera_anglev+=changev
		rotate_y(deg_to_rad(changev))
	elif event is InputEventMouseButton and event.is_action_pressed("smash"):
		var selectedObject = $playerCollision/playerShape/mainCamera.selectedObject;
		if selectedObject:
			emit_signal("smash", selectedObject)


func _on_debug(message):
	$playerCollision/playerShape/mainCamera/debug.text = message

func _on_debug_timeout():
	var debug = $playerCollision/playerShape/mainCamera/debug

	if debug.text != "":
		debug.text = ""
