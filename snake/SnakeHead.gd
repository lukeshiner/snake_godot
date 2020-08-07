extends Node2D

export(int) var start_length = 3

const sprite_size = 16
onready var SnakeBody = preload("res://snake/SnakeBody.tscn")

const directions = [Vector2.UP, Vector2.LEFT, Vector2.RIGHT, Vector2.DOWN]
var direction = Vector2.RIGHT
var next_direction = direction
var apple_eaten = false

onready var head = $SnakeSectionSprite
onready var sections = [head]

func _ready():
	randomize()
	head.set_sprite(Vector2.ZERO, Vector2.LEFT)
	var start_position = Vector2(global_position.x, global_position.y)
	global_position = Vector2.ZERO
	head.global_position = start_position
	for i in range(start_length, 0, -1):
		add_section(
			Vector2(head.global_position.x - sprite_size*i, head.global_position.y),
			head.global_position,
			Vector2(head.global_position.x - sprite_size*(i+1), head.global_position.y)
		)
	set_tail()

func add_section(location, previous, next):
	var new_section = SnakeBody.instance()
	self.add_child(new_section)
	new_section.global_position = location
	var directions = new_section.sprite.get_directions(previous, next)
	new_section.sprite.set_sprite(directions[0], directions[1])
	sections.insert(1, new_section)

func set_tail():
	var last_section = sections[-1]
	var directions = last_section.sprite.get_directions(sections[-2].global_position, null)
	last_section.sprite.set_sprite(directions[0], directions[1])

func _input(event):
	if event.is_action_released("up"):
		next_direction = Vector2.UP
	elif event.is_action_released("left"):
		next_direction = Vector2.LEFT
	elif event.is_action_released("down"):
		next_direction = Vector2.DOWN
	elif event.is_action_released("right"):
		next_direction = Vector2.RIGHT

func update_direction():
	if next_direction != direction * -1:
		direction = next_direction

func remove_end():
	var remove_section = sections.pop_back()
	remove_section.queue_free()
	set_tail()

func update_length():
	if not apple_eaten:
		remove_end()
	else:
		apple_eaten = false

func _on_Timer_timeout():
	update_direction()
	var old_location = head.global_position
	head.global_position += direction * sprite_size
	var head_directions = head.get_directions(null, old_location)
	head.set_sprite(head_directions[0], head_directions[1])
	add_section(
		old_location,
		head.global_position,
		sections[1].global_position
	)
	update_length()


func _on_Area2D_area_entered(area):
	var collided_layer = area.collision_layer
	if collided_layer == 8:
		apple_eaten = true
	elif collided_layer == 5:
		get_tree().paused = true
