@tool
extends EditorPlugin

var main_screen
var main_screen_children

const MapView = preload("res://addons/pocketrpg/map_view.tscn")
var map_view_instance

func _enter_tree():
	map_view_instance = MapView.instantiate()
	
	main_screen = EditorInterface.get_editor_main_screen()
	main_screen.add_child(map_view_instance)
	
	# Hide the main panel. Very much required(?)
	_make_visible(false)


func _exit_tree():
	if map_view_instance:
		map_view_instance.queue_free()


func _has_main_screen():
	return true


func _make_visible(visible):
	if map_view_instance:
		map_view_instance.visible = visible


func _get_plugin_name():
	return "Map"
