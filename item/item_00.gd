extends RigidBody2D

var v_item_selection : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	v_item_selection = get_node("ItemList")
	
	#debug only
	f_randomize_item()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func f_set_item_index(item_index : int):
	v_item_selection.frame = item_index
	pass
	
func f_set_item_pos(position : Vector2):
	global_position = position
	pass

func f_randomize_item():
	var l_min = 1;
	var l_max = v_item_selection.sprite_frames.get_frame_count(v_item_selection.animation) - 1
	v_item_selection.frame = randi_range(l_min,l_max)
	pass

func f_pickup() -> int:
	queue_free()
	return v_item_selection.frame
