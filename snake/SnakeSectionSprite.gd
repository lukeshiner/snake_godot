extends Sprite

enum {
	HEAD_UP,
	HEAD_RIGHT,
	HEAD_DOWN,
	HEAD_LEFT,
	BODY_UP,
	BODY_DOWN,
	BODY_LEFT,
	BODY_RIGHT,
	TAIL_RIGHT,
	TAIL_UP,
	TAIL_DOWN,
	TAIL_LEFT,
	BEND_LEFT_UP,
	BEND_RIGHT_UP,
	BEND_UP_LEFT,
	BEND_UP_RIGHT,
	BEND_DOWN_LEFT,
	BEND_DOWN_RIGHT,
	BEND_RIGHT_DOWN,
	BEND_LEFT_DOWN,
}

#0	HEAD_UP,
#1	HEAD_RIGHT,
#2	HEAD_DOWN,
#3	HEAD_LEFT,
#4	BODY_UP,
#5	BODY_DOWN,
#6	BODY_LEFT,
#7	BODY_RIGHT,
#8	TAIL_RIGHT,
#9	TAIL_UP,
#10	TAIL_DOWN,
#11	TAIL_LEFT,
#12	BEND_LEFT_UP,
#13	BEND_RIGHT_UP,
#14	BEND_UP_LEFT,
#15	BEND_UP_RIGHT,
#16	BEND_DOWN_LEFT,
#17	BEND_DOWN_RIGHT,
#18	BEND_RIGHT_DOWN,
#19	BEND_LEFT_DOWN,


var directions = {
	[Vector2.ZERO, Vector2.DOWN]: HEAD_UP,
	[Vector2.ZERO, Vector2.RIGHT]: HEAD_LEFT,
	[Vector2.ZERO, Vector2.UP]: HEAD_DOWN,
	[Vector2.ZERO, Vector2.LEFT]: HEAD_RIGHT,
	[Vector2.UP, Vector2.DOWN]: BODY_DOWN,
	[Vector2.UP, Vector2.RIGHT]: BEND_LEFT_UP,
	[Vector2.UP, Vector2.LEFT]: BEND_DOWN_LEFT,
	[Vector2.DOWN, Vector2.UP]: BODY_UP,
	[Vector2.DOWN, Vector2.RIGHT]: BEND_RIGHT_DOWN,
	[Vector2.DOWN, Vector2.LEFT]: BEND_UP_RIGHT,
	[Vector2.LEFT, Vector2.UP]: BEND_RIGHT_UP,
	[Vector2.LEFT, Vector2.RIGHT]: BODY_RIGHT,
	[Vector2.LEFT, Vector2.DOWN]: BEND_LEFT_DOWN,
	[Vector2.RIGHT, Vector2.UP]: BEND_DOWN_RIGHT,
	[Vector2.RIGHT, Vector2.LEFT]: BODY_LEFT,
	[Vector2.RIGHT, Vector2.DOWN]: BEND_UP_LEFT,
	[Vector2.RIGHT, Vector2.ZERO]: TAIL_RIGHT,
	[Vector2.UP, Vector2.ZERO]: TAIL_UP,
	[Vector2.DOWN, Vector2.ZERO]: TAIL_DOWN,
	[Vector2.LEFT, Vector2.ZERO]: TAIL_LEFT,
}

func get_directions(headward, tailward):
	var direction_to_previous
	var direction_to_next
	if headward == null:
		direction_to_previous = Vector2.ZERO
	else:
		direction_to_previous = global_position.direction_to(headward).normalized()
	if tailward == null:
		direction_to_next = Vector2.ZERO
	else:
		direction_to_next = global_position.direction_to(tailward).normalized()
	return [direction_to_previous, direction_to_next]

func set_sprite(direction_to_previous, direction_to_next):
	frame = directions[[direction_to_previous, direction_to_next]]
