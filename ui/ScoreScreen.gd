extends Node2D

var digits = []
var score = 0 setget update_score
onready var digit_container = $Digits
onready var digit_count = digit_container.get_child_count()

func _ready():
	for i in range(digit_count):
		digits.append(digit_container.get_child(i))

func set_score(score):
	for digit in digits:
		digit.frame = 0
	var score_string = str(score)
	for i in range(score_string.length()-1, -1, -1):
		var digit = int(score_string[i])
		digits[-score_string.length() + i].frame = digit

func update_score(value):
	score = value
	set_score(value)
