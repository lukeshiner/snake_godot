extends Area2D

var sprite_size = 16
export(int) var value = 3

onready var playArea = get_tree().current_scene.get_node("PlayArea")
onready var snake_head = get_tree().current_scene.get_node("SnakeHead")
onready var score_screen = get_tree().current_scene.get_node("UI/ScoreScreen")

func eat():
	move()
	score_screen.score += value

func move():
	var new_location = playArea.random_location()
	global_position = new_location.snapped(Vector2(sprite_size, sprite_size))
	for section in snake_head.sections:
		if global_position == section.global_position:
			move()
			break
