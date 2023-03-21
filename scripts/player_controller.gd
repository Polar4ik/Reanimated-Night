extends Node3D

@export var rot_speed:float = 2

var rot_zone:float

@export var max_rot:float
@export var min_rot:float
var mouse_position:Vector2

func _ready() -> void:
	rot_zone = get_viewport().size.x / 5

func _process(delta: float) -> void:
	mouse_position = get_viewport().get_mouse_position()
	camera_rotate()

func camera_rotate():
	rotation.x = lerp(rotation.x,deg_to_rad(0),1)
	if mouse_position.x < rot_zone:
		rotation.y += rot_speed * get_process_delta_time()
	elif mouse_position.x > get_viewport().size.x - rot_zone:
		rotation.y -= rot_speed * get_process_delta_time()
	
	rotation.y = clamp(rotation.y,deg_to_rad(min_rot),deg_to_rad(max_rot))
