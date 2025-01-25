class_name Adspunjerer extends CharacterBody2D

var walk_speed : float = 2000.0
var sprite : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = get_node("AnimatedSprite2D")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	direction.y = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")
	
	if direction.length_squared() > 1:
		direction = direction.normalized()
	
	velocity = direction * walk_speed
	
	sprite.speed_scale = direction.length()
	
	if direction.length() == 0:
		sprite.frame = 0
	
	pass


func _physics_process(delta: float) -> void:
	move_and_slide()
