extends Node2D

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass


func f_pickup_item(player_ref : CharacterBody2D):
	print("Item picked up succs")
	player_ref.f_add_pickable(self)
	# item despawn
	# player add inv 
	pass
