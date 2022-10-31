extends KinematicBody

export var speed = 15
export var fall_acceleration = 75
export var jump_impulse = 20
var velocity = Vector3.ZERO


func _physics_process(delta):
    var direction = Vector3.ZERO

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
    velocity.y -= fall_acceleration * delta 

    if is_on_floor() and Input.is_action_pressed("jump"):
        velocity.y += jump_impulse

    velocity = move_and_slide(velocity, Vector3.UP)
