# "tool" needs to be added to have the code working inside the editor
# This is important for the Warning func
tool
extends Area2D

export var next_scene: PackedScene
onready var anim_player: AnimationPlayer = $AnimationPlayer
# $AnimationPlayer == get_node("AnimationPlayer")

# Display warning if there's no next level
# This function is only important for the editor
func _get_configuration_warning() -> String:
	return "The next scene can't be empty" if not next_scene else ""



func _on_body_entered(_body: PhysicsBody2D) -> void:
	# Name of body ("Portal") doesn't have to be added to the func name, since the body is the root node of the scene
	PlayerData.level_finished()
	teleport()

# Play animation of fade to black ("Fade_in")
func teleport() -> void:
	# Start the animation
	anim_player.play("Fade_to_black")
	# Wait for the animation to finish
	yield(anim_player, "animation_finished")
	# Play next level
		# get_tree() gets the entire scene tree
		# change_scene_to(scene) changes the scene to the next level
	get_tree().change_scene_to(next_scene)
