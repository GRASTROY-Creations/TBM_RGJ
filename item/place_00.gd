extends Area2D

var v_item_scene : PackedScene = load("res://item/item_00.tscn")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func f_drop(item_index : int, player: CharacterBody2D):
	if v_item_scene:
		var l_item_instance = v_item_scene.instantiate()
		add_child(l_item_instance)
		l_item_instance.f_set_item_index(item_index)
		l_item_instance.f_set_item_pos(global_position)
		player.f_mod_points(true,1)
	pass
