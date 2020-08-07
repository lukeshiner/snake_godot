extends Node2D

export(int) var start_frame = 0
export(Vector2) var direction = Vector2.UP

onready var sprite = $DirectionButtonSprite
onready var snake = get_tree().current_scene.get_node("SnakeHead")

func _ready():
	sprite.frame = start_frame

func _input_event(viewport, event, shape_idx):
	print("click")
	if (event.type == InputEvent.MOUSE_BUTTON
	and event.button_index == BUTTON_LEFT
	and event.pressed):
		print("Clicked")

func _on_Button_button_up():
	print("unclick")
	sprite.frame -= 4
	snake.next_direction = direction


func _on_Button_button_down():
	print("click")
	sprite.frame += 4
