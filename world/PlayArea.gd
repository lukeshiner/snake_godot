extends Node2D

onready var top = $Top
onready var left = $Left
onready var bottom = $Bottom
onready var right = $Right

func is_inside(location):
	if (location.y >= top.global_position.y
		and location.y <= bottom.global_position.y
		and location.x >= left.global_position.x
		and location.x <= right.global_position.x):
			return true
	else:
		return false

func exited_direction(location):
	var direction = Vector2.ZERO
	if location.y <= top.global_position.y:
		direction.y = -1
	if location.y >= bottom.global_position.y:
		direction.y = 1
	if location.x <= left.global_position.x:
		direction.x = -1
	if location.x >= right.global_position.x:
		direction.x = 1
	return direction
