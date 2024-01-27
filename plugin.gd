@tool
extends EditorPlugin

@onready var temp_scene = preload("res://addons/realisticlight/light_scene.tscn")
var button = Button.new()

func _enter_tree():
	button.text = "Instant Realistic Light"
	button.connect("pressed", Callable(self, "_on_button_pressed"))
	add_control_to_container(CONTAINER_SPATIAL_EDITOR_MENU, button)

func _exit_tree():
	remove_control_from_container(CONTAINER_SPATIAL_EDITOR_MENU, button)
	button.free()

func _on_button_pressed():
	var scene = temp_scene.instantiate()
	get_tree().get_edited_scene_root().add_child(scene)
	scene.set_owner(get_tree().get_edited_scene_root())
