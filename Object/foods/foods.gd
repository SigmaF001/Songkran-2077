extends StaticBody2D

@export var food_name : String

func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.score += 20
		queue_free()
