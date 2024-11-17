extends CharacterBody2D

const CON_SPEED = 300.0
var v_char_cam : Camera2D;
var v_char_sprite : AnimatedSprite2D
var v_activation_collider : Area2D
var v_active_subitem : Area2D

func _ready() -> void:
	v_char_sprite = get_node("AnimatedSprite2D")
	v_activation_collider = get_node("Area2D")
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	f_movement()
	f_rotation()
	f_play_moving_anim()
	f_pickup_items()
	pass

func f_add_pickable(item : Area2D):
	if item != null:
		print("Picking up failed: null error")
		return;
	print("Picking up !!!")
	v_activation_collider.monitoring = false;
	v_active_subitem = item;
	v_activation_collider.add_child(v_active_subitem)
	return;

func f_pickup_items():
	if Input.is_action_just_released("game_cling"):

		if v_active_subitem != null:
			print("Letting it fall")
			v_activation_collider.remove_child(v_active_subitem)
			get_tree().root.get_node("LayerItems").add_child(v_active_subitem)
			v_active_subitem = null;
			return

		var colliding_objects = v_activation_collider.get_overlapping_areas();
		if colliding_objects.size() > 0:
			for item in colliding_objects:
				if item.has_method("f_pickup_item"):
					print("Calls Function")
					item.f_pickup_item(self);
					# item -> send pickup
					break;
			print("Collision Detected");
			return
		else:
			print("Nothing to Pick up")
			return
	pass

func f_play_moving_anim():
	if velocity.length() != 0:
		v_char_sprite.play()
	else:
		v_char_sprite.stop()
	return

func f_movement():
	var direction_x := Input.get_axis("game_left", "game_right")
	var direction_y := Input.get_axis("game_up", "game_down")
	if direction_x or direction_y:
		velocity = Vector2(direction_x, direction_y) * CON_SPEED
	else:
		direction_x = move_toward(direction_x, 0, CON_SPEED)
		direction_y = move_toward(direction_y, 0, CON_SPEED)
		velocity = Vector2(direction_x, direction_y) * CON_SPEED
	move_and_slide()
	return

func f_rotation():
	if velocity.length() != 0:
		global_rotation = velocity.angle() + deg_to_rad(90)
	return
