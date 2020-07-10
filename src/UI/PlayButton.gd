tool
extends Button

export(String, FILE) var next_scene_path = "res://src/screens/ErrorScreen.tscn"

func _on_button_up() -> void:
	# if play again, put score to 0
	if next_scene_path == "res://src/levels/Level01.tscn":
		PlayerData.score = 0
		PlayerData.level_score = 0
	get_tree().change_scene(next_scene_path)


func _get_configuration_warning() -> String:
	return "Next scene path must be set" if next_scene_path == "" else ""
