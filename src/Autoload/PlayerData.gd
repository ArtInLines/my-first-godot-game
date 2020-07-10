extends Node

signal score_updated
signal player_died

var score: = 0
var level_score: = 0 setget set_score, get_score
var deaths: = 0 setget set_deaths

func reset() -> void:
	score = 0
	deaths = 0

func level_finished() -> void:
	score += level_score
	level_score = 0

func set_score(value: int) -> void:
	level_score += value
	emit_signal("score_updated")

func set_deaths(_value: int) -> void:
	deaths += 1
	level_score = 0
	emit_signal("player_died")

func get_score() -> int:
	return score + level_score
