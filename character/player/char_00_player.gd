extends CharacterBody2D

const CON_SPEED = 300.0
var v_animations_sprite : AnimatedSprite2D
var v_interaction_range : Area2D
var v_item_list : AnimatedSprite2D
var v_item_scene : PackedScene = load("res://item/item_00.tscn")
var v_points : int = 0;
var v_speed_up_factor = 1.5;

func _ready() -> void:
	v_animations_sprite = get_node("AnimatedSprite2D")
	v_interaction_range = get_node("Area2D_Interaction")
	v_item_list = get_node("ItemList")
	pass

func _process(delta: float) -> void:
	f_sys_movement()
	f_sys_grabbing()
	pass

func _physics_process(delta: float) -> void:
	pass


func f_sys_movement():
	var direction_x := Input.get_axis("game_left", "game_right")
	var direction_y := Input.get_axis("game_up", "game_down")
	if direction_x or direction_y:
		# set velocity to movement
		if Input.is_action_pressed("game_speedup"):
			v_speed_up_factor = 2.0
		else:
			v_speed_up_factor = 1.0
		velocity = Vector2(direction_x, direction_y) * CON_SPEED * v_speed_up_factor
		# set rotation
		global_rotation = velocity.angle() + deg_to_rad(90)
		# play animation
		v_animations_sprite.play()
	else:
		# set movement to stop
		velocity = Vector2(direction_x, direction_y)
		# stop animation
		v_animations_sprite.stop()
	if Input.is_action_just_released("game_jump"):
		velocity = velocity * 15
	move_and_slide()
	pass

func f_sys_grabbing():
	if Input.is_action_just_released("game_cling"):
		if v_item_list.frame == 0:
			# grab item
			var interacted_stuff = v_interaction_range.get_overlapping_bodies()
			if interacted_stuff.size() > 0:
				for item in interacted_stuff:
					if item.has_method("f_pickup"):
						v_item_list.frame = item.f_pickup();
						break;
			pass
		else:
			# drop item
			var interacted_areas = v_interaction_range.get_overlapping_areas()
			if interacted_areas.size() > 0:
				for area in interacted_areas:
					if area.has_method("f_drop"):
						area.f_drop(v_item_list.frame, self) # drop item to place
						# hide item on player
						v_item_list.frame = 0
						return;
						
			else:
				# hide item on player
				v_item_list.frame = 0
				# drop item to world
				if v_item_scene:
					var l_item_instance = v_item_scene.instantiate()
					var l_position : Node2D = get_node("Node2D_Drop_Position")
					l_item_instance.global_position = l_position.global_position
					find_parent("Lvl01Game").get_node("World_Items").add_child(l_item_instance)
				pass
		pass
	pass

func f_mod_points(add:bool,value : int):
	if add:
		v_points = v_points+value
	else:
		v_points = v_points- value	
	print("Points: ", v_points)
	pass
