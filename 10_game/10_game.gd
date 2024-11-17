extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_released("game_menu"):
		get_tree().change_scene_to_file("res://10_game/10_game.tscn");
	pass
