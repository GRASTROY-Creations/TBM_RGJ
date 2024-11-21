extends Node2D

var v_char_train : CharacterBody2D;
var v_entrance_zone : CollisionShape2D;
var v_spawnpoint_left : Node2D;
var v_spawnpoint_right : Node2D;
var v_timer_restart : Timer;
var v_timer_station : Timer;

var v_source_direction: int = 0;
const v_source_range : int = 100;
var v_is_at_station : bool = false;
var temp_speed = 1;


func _ready() -> void:
	v_char_train = get_node("CharacterBody2D")
	v_entrance_zone = get_node("CharacterBody2D/CollisionShape2D_Entrance")
	v_spawnpoint_left = get_node("CharacterBody2D/Node2D_SpawnPoint_01")
	v_spawnpoint_right = get_node("CharacterBody2D/Node2D_SpawnPoint_02")
	v_timer_restart = get_node("Timer_Train_Restart")
	v_timer_station = get_node("Timer_Train_Station")
	f_random_spawn()
	pass

func _process(delta: float) -> void:
	if !v_is_at_station:
		f_processing()
	pass

func _on_timer_train_restart_timeout() -> void:
	f_random_spawn()
	pass

func _on_timer_train_station_timeout() -> void:
	v_is_at_station = false;
	print ("left station")
	pass


func f_random_spawn() -> void:
	v_source_direction = randi_range(-1,1);
	if v_source_direction == 0:
		v_char_train.visible = true # false
	else:
		v_char_train.position.x = v_source_range * v_source_direction
		#v_char_train.position.x = position.x + v_source_range * v_source_direction
		v_char_train.visible = true
	v_char_train.velocity = Vector2(v_source_direction * -1 * temp_speed, 0);
	pass

func f_processing():
	if v_source_direction == 0:
		# todo spawn npc s on sides let walt to train
		print("Restart Initialized at")
		print(v_char_train.position)
		f_random_spawn()
	else:
		f_movement()
	pass

func f_movement() -> void:
	if (v_char_train.position.x > position.x + v_source_range) or (v_char_train.position.x < position.x - v_source_range):
		print("Time to Restart")
		f_random_spawn()
	#elif (v_source_direction == -1):
		#if (v_char_train.position.x < position.x):
			#v_char_train.position.x = lerp(v_char_train.position.x, position.x, 0.1);
		#elif (v_char_train.position.x >= position.x):
			#v_char_train.position.x = lerp(position.x, position.x + v_source_range * -1 * v_source_direction, 0.1);
	#elif (v_source_direction == 1):
		#if (v_char_train.position.x >= position.x):
			#v_char_train.position.x = lerp(v_char_train.position.x, position.x, 0.1);
		#elif (v_char_train.position.x < position.x):
			#v_char_train.position.x = lerp(position.x, position.x + v_source_range * -1 * v_source_direction, 0.1);
	v_char_train.move_and_slide()
	pass
