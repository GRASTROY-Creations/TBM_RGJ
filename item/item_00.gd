extends RigidBody2D

var v_item_selection : AnimatedSprite2D
var v_item_index : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	v_item_selection = get_node("ItemList")
	var l_min = 1;
	var l_max = v_item_selection.sprite_frames.get_frame_count(v_item_selection.animation) - 1
	print("Von: %d : %d" %[l_min, l_max])
	v_item_index = randi_range(l_min,l_max)
	v_item_selection.frame = v_item_index
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func f_interact() -> int:
	queue_free()
	return v_item_index
