class_name Adspunjerer2D extends CharacterBody2D

var walk_speed : float = 2000.0
var sprite : AnimatedSprite2D

var rng = RandomNumberGenerator.new()

const TOTAL_HIT_POINTS: int = 10  # sensible
var current_hp: int = TOTAL_HIT_POINTS
var base_attack_power: float = 5.0
var spunjelity: float = 3.5  # todo :: tuning
var spunjelity_bonus_roll_n: int = 20  # it's like DnD?

func get_spunj():
	return spunjelity + rng.randi_range(1, spunjelity_bonus_roll_n)

func get_attack_power():
	return base_attack_power * (1 + get_spunj() * 0.1)

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
