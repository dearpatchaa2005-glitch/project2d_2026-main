extends Node2D

@export var speed: float = 100.0
@export var move_distance: float = 150.0

var start_x: float = 0.0
var direction: int = 1

func _ready():
	start_x = global_position.x

func _physics_process(delta):
	position.x += speed * direction * delta
	
	if position.x > start_x + move_distance:
		direction = -1
	elif position.x < start_x - move_distance:
		direction = 1
