extends StaticBody2D

@export var static_body : StaticBody2D
@export var food_name : String

const gravity : float = 980.0

func _ready():
	random_position()

func _physics_process(delta):
	pass

func random_position():
	self.position = (Vector2(randf_range(-700,200), randf_range(300, -300)))

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.score += 20
		queue_free()


func _on_delay_timeout():
	queue_free()
