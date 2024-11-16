extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta: float) -> void:
	if Input.is_action_just_released("game_menu"):
		get_tree().change_scene_to_file("res://10_game/10_game.tscn");
	pass

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("game_left", "game_right")
	var direction_y := Input.get_axis("game_up", "game_down")
	if direction_x or direction_y:
		velocity = Vector2(direction_x, direction_y) * SPEED
	else:
		direction_x = move_toward(direction_x, 0, SPEED)
		direction_y = move_toward(direction_y, 0, SPEED)
		velocity = Vector2(direction_x, direction_y) * SPEED
		
	move_and_slide()
	pass
