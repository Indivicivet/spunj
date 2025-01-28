extends Camera2D

var adspunjerer : Adspunjerer2D

# Using a hidden discretised logarithmic zoom level for peace of mind
var zoom_level : int = log(5) / log(1.001)
var min_zoom_level : int = 0
var max_zoom_level : int = log(10) / log(1.001)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	adspunjerer = get_parent().get_node("Adspunjerer2D")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var zoom_change : int = 0
	var zoom_in_strength = Input.get_action_strength("zoom_in")
	var zoom_out_strength = Input.get_action_strength("zoom_out")

	if zoom_in_strength > 0:
		zoom_change = -4 * zoom_in_strength
	elif zoom_out_strength > 0:
		zoom_change = 4 * zoom_out_strength
	elif Input.is_action_just_released("zoom_in"):
		zoom_change = -40
	elif Input.is_action_just_released("zoom_out"):
		zoom_change = 40

	zoom_level += zoom_change
	if zoom_level < min_zoom_level:
		zoom_level = min_zoom_level
	if zoom_level > max_zoom_level:
		zoom_level = max_zoom_level
	
	var zoom_factor = pow(1.001, -zoom_level)
	
	if (position - adspunjerer.position).length_squared() < 1:
		position = adspunjerer.position
	else:
		var catchup_factor = 0.05 * zoom_factor
		position = (1 - catchup_factor) * position + catchup_factor * adspunjerer.position
	
	zoom.x = zoom_factor
	zoom.y = zoom_factor
	
	pass
