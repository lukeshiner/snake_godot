extends Node2D


onready var animationPlayer = $AnimationPlayer
onready var score = get_tree().current_scene.get_node("UI/ScoreScreen").score
onready var scoreLabel = $ScoreLabel

func _ready():
	animationPlayer.play("Fade Out")
	scoreLabel.text = "Score: " + str(score)


func _on_RestartButton_button_up():
	get_tree().reload_current_scene()
