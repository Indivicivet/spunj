class_name Penny3D extends RigidBody3D

var rng = RandomNumberGenerator.new()

var is_wet: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	
	var sprite_container_face : Node3D = get_node("FaceSpriteContainer")
	var sprite_face_new : Sprite3D = sprite_container_face.get_node("FaceNew")
	var sprite_face_old : Sprite3D = sprite_container_face.get_node("FaceOld")
	var sprite_container_rim : Node3D = get_node("RimSpriteContainer")
	var sprite_rim_new : Sprite3D = sprite_container_rim.get_node("RimNew")
	var sprite_rim_old : Sprite3D = sprite_container_rim.get_node("RimOld")
	
	if rng.randf() < 0.5:
		sprite_face_new.texture = load("res://assets/sprites/coins/1p/1p_reverse_new.png")
		sprite_face_old.texture = load("res://assets/sprites/coins/1p/1p_reverse_old.png")
	
	sprite_container_face.rotate_y(2 * PI * rng.randf())
	
	var oldness = rng.randf()
	sprite_face_new.modulate.a = oldness
	sprite_rim_new.modulate.a = oldness


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
