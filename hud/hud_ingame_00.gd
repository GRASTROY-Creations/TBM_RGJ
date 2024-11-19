extends Control

var v_points_label : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	v_points_label = find_child("Label_Points", true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func f_update_hud_points(value : int) -> void:
	var temp = "%d"
	var temp_end = temp % value;
	v_points_label.text = temp_end
	pass
	
