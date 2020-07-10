extends Actor 

export var stomp_impulse: = 1400.0

# Jumping when killing enemy
func _on_EnemyDetector_area_entered(_area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)

# Dying when hit by enemy
func _on_EnemyDetector_body_entered(_body: Node) -> void:
	die()
	

# Repeating every frame, 60 times a second
func _physics_process(_delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)	

# get input from keyboard for direction
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)

# get speed/velocity for player to move
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
		) -> Vector2:
			var new_velocity: = linear_velocity
			new_velocity.x = speed.x * direction.x
			new_velocity.y +=  gravity * get_physics_process_delta_time()
			if direction.y == -1.0:
				new_velocity.y = speed.y * direction.y
			if is_jump_interrupted:
				new_velocity.y = 0.0
			return new_velocity

# calc how high the player jumps after killing enemy
func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var output: = linear_velocity
	output.y = -impulse
	return output

func die() -> void:
	PlayerData.set_deaths(1)
	queue_free()
