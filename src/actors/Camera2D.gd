extends Camera2D

export var Offset_Factor = 2.5

# Move the camera offset according to player Input
func _physics_process(_delta: float) -> void:
	var input_x = (Input.get_action_strength("move_camera_right") - Input.get_action_strength("move_camera_left")) * Offset_Factor
	var input_y = (Input.get_action_strength("move_camera_down") - Input.get_action_strength("move_camera_up")) * Offset_Factor
	
	var new_x = get_offset().x + input_x
	var new_y = get_offset().y + input_y
	
	# Limit offset values
	if new_x < -700:
		new_x = -700
	if new_x > 150:
		new_x = 150
	if new_y > 450:
		new_y = 450
	if new_y < 0:
		new_y = 0
	
	set_offset(Vector2(new_x, new_y))
