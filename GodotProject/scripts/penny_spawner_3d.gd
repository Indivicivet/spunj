extends Node3D

var rng = RandomNumberGenerator.new()
var width : int = 20
var length : int = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	
	var penny_scene = load("res://scenes/coins/penny_3d.tscn")
	
	var positions : Array[Vector3]
	for i in range(100):
		var new_position : Vector3
		new_position.x = width * (rng.randf() - 0.5)
		new_position.z = length * (rng.randf() - 0.5)
		var too_close = false
		for position in positions:
			if new_position.distance_squared_to(position) < 5:
				too_close = true
				break
		if too_close:
			continue
		
		positions.append(new_position)
		
		var penny = penny_scene.instantiate()
		penny.position = new_position
		add_child(penny)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
