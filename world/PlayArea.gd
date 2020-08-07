extends Node2D

onready var top = $Top
onready var left = $Left
onready var bottom = $Bottom
onready var right = $Right
var tile_size = 16

func is_inside(location):
	if (location.y >= top.global_position.y
		and location.y < bottom.global_position.y
		and location.x > left.global_position.x
		and location.x < right.global_position.x):
			return true
	else:
		return false

func exited_direction(location):
	var direction = Vector2.ZERO
	if location.y < top.global_position.y:
		direction.y = -1
	if location.y > bottom.global_position.y - tile_size:
		direction.y = 1
	if location.x < left.global_position.x:
		direction.x = -1
	if location.x > right.global_position.x - tile_size:
		direction.x = 1
	return direction

func random_location():
	var x = rand_range(left.global_position.x, right.global_position.x-tile_size)
	var y = rand_range(top.global_position.y, bottom.global_position.y-tile_size)
	return Vector2(x, y)
