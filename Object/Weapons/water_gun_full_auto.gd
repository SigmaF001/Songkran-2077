extends StaticBody2D

func _ready():
	random_position()
	
func random_position():
	self.position = (Vector2(randf_range(-700,200), randf_range(300, 200)))

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.weapon_sprite.texture = $Sprite2D.texture
		body.name_weapon = "GunFullAuto"
		body.number_bullet = 20
		queue_free()
