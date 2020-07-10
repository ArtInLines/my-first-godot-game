extends Area2D

# Onready var stores the var globally as soon as the coin in ready
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var score: = 5

# Same as func _on_Coin_body_entered()
func _on_body_entered(_body: PhysicsBody2D) -> void:
	picked()

func picked() -> void:
	PlayerData.set_score(score)
	anim_player.play("Fade_out")
