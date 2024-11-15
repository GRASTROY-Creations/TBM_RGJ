extends Control;

var v_Main_Tab_Container;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	v_Main_Tab_Container = get_node("%TabContainer") as TabContainer;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func f_05_load_level():
	get_tree().unload_current_scene();
	get_tree().change_scene_to_file("res://10_game/10_game.tscn");
	return;

func f_05_customize_open_tab():
	v_Main_Tab_Container.set_current_tab(1);
	return;

func f_05_customize_back_to_menu():
	v_Main_Tab_Container.set_current_tab(0);
	return;

func f_05_exit_game():
	get_tree().quit(0);
	return;
	
