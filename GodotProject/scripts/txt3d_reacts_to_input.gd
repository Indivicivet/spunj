extends Label3D


var default_text


func _ready() -> void:
	default_text = text


func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		text = (
			"Actions are not yet known. You are trapped in the SPUNJ forever,"
			+ " even though you tried to act. Unlucky."
		)
	else:
		text = default_text
