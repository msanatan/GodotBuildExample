extends CharacterBody3D

@export var speed = 5
@export var jump_impulse = 3
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y += jump_impulse

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	elif Input.is_action_pressed("move_left"):
		direction.x -= 1
	
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	elif Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	move_and_slide()
