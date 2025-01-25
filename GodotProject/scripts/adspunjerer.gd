extends CharacterBody2D

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
