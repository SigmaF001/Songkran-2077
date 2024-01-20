extends CharacterBody2D

@onready var p_shooter : CharacterBody2D

var speed = 1000
var direction = Vector2.ZERO

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()


func _on_timer_timeout():
	queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		p_shooter.score += 5
		body.score -= 5
		print("Hit the player.")
		queue_free()
