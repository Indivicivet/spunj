extends Node3D

const SPAWN_DELAY = 1
const SPAWN_INTERVAL = 0.2
const INITIAL_PENNIES = 10

var rng = RandomNumberGenerator.new()
var width : int = 20
var length : int = 20
var latest_spawn = SPAWN_DELAY
@onready var penny_scene = load("res://scenes/coins/penny_3d.tscn")


func spawn_penny() -> void:
	var new_position : Vector3
	# try a bunch of times to avoid existing pennies; if we fail, spawn anyway
	for i in range(100):
		new_position.x = width * (rng.randf() - 0.5)
		new_position.z = length * (rng.randf() - 0.5)
		var too_close = false
		for child in self.get_children():
			if new_position.distance_squared_to(child.position) < 5:
				too_close = true
				break
		if not too_close:
			break  # spawn :)
	var penny = penny_scene.instantiate()
	penny.position = new_position
	add_child(penny)


func _ready() -> void:
	rng.randomize()
	for i in range(INITIAL_PENNIES):
		spawn_penny()


func _process(delta: float) -> void:
	latest_spawn -= delta
	if latest_spawn < 0:
		spawn_penny()
		latest_spawn = SPAWN_INTERVAL
