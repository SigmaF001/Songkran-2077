extends StaticBody2D



func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.weapon_sprite.texture = $Sprite2D.texture
		body.name_weapon = "GunFullAuto"
		body.number_bullet = 20
		queue_free()
