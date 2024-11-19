extends Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func sf_start_game():
	get_tree().change_scene_to_file("res://level/lvl_01_game.tscn");
	pass

func sf_exit_game():
	get_tree().quit(0);
	pass
