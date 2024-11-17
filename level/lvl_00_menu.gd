extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func sf_start_game():
	get_tree().change_scene_to_file("res://level/lvl_01_game.tscn");
	pass

func sf_exit_game():
	get_tree().quit(0);
	pass
