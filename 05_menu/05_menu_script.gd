extends Control;

var v_Main_Tab_Container : TabContainer;

func _ready() -> void:
	v_Main_Tab_Container = get_node("%TabContainer");
	pass

func _process(delta: float) -> void:
	pass


func fc_05_load_level():
	get_tree().change_scene_to_file("res://10_game/10_game.tscn");
	return;

func fc_05_customize_open_tab():
	v_Main_Tab_Container.set_current_tab(1);
	return;

func fc_05_customize_back_to_menu():
	v_Main_Tab_Container.set_current_tab(0);
	return;

func fc_05_exit_game():
	get_tree().quit(0);
	return;
