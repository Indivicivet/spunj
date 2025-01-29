extends Node3D

var parent : Node3D
var camera : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()
	camera = get_tree().root.get_node("Game3D").get_node("CameraPivot")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees.y = camera.rotation_degrees.y - parent.rotation_degrees.y
