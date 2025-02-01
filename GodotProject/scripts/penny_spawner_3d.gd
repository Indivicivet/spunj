extends Node3D

const SPAWN_DELAY = 0
const SPAWN_INTERVAL = 0.2

var rng = RandomNumberGenerator.new()
var width : int = 20
var length : int = 20
var latest_spawn = SPAWN_DELAY
@onready var penny_scene = load("res://scenes/coins/penny_3d.tscn")
var positions : Array[Vector3]

func spawn_penny() -> void:
	var new_position : Vector3
	new_position.x = width * (rng.randf() - 0.5)
	new_position.z = length * (rng.randf() - 0.5)
	var too_close = false
	for position in positions:
		if new_position.distance_squared_to(position) < 5:
			too_close = true
			break
	if too_close:
		return  # todo :: logic needs updating for new penny spawning :)
	positions.append(new_position)
	var penny = penny_scene.instantiate()
	penny.position = new_position
	add_child(penny)


func _ready() -> void:
	rng.randomize()
	for i in range(100):
		spawn_penny()


func _process(delta: float) -> void:
	latest_spawn -= delta
	if latest_spawn < 0:
		spawn_penny()
		latest_spawn = SPAWN_INTERVAL
