extends CharacterBody2D

@export var player_character : CharacterBody2D
@export var speed : float = 300.0

@onready var sprite = $Sprite2D
@onready var weapon_sprite = $Weapon

var bullet = preload("res://System/bullet.tscn")
var score = 0
var gravity = 900
var direction
var jump_velocity = -600
var shoot_cooldown = false
var name_weapon : String
var number_bullet : int

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump_2") and is_on_floor():
		velocity.y = jump_velocity
	
	direction = Input.get_axis("left_2", "right_2")
	velocity.x = direction * speed
	
	if is_on_floor() and Input.is_action_just_pressed("down_2"):
		position.y += 1
	
	Global.p_1_score = score
	
	move_and_slide()
	reverse_gravity()
	facing_direction()
	check_weapon()

func reverse_gravity():
	if Input.is_action_just_pressed("r_gravity_2"):
		gravity *= -1
		if gravity < 0:
			jump_velocity *= -1
			sprite.flip_v = true
			$CollisionShape2D.position.y = -22.5
		if gravity > 0:
			jump_velocity *= -1
			sprite.flip_v = false
			$CollisionShape2D.position.y = 22.5
		

func facing_direction():
	if direction < 0:
		sprite.flip_h = true
		weapon_sprite.flip_h = true
		weapon_sprite.position.x = -94
		$Marker2D.position.x = -184
		$Marker2D.rotation = 180
	if direction > 0:
		sprite.flip_h = false
		weapon_sprite.flip_h = false
		weapon_sprite.position.x = 94
		$Marker2D.position.x = 184
		$Marker2D.rotation = 0

func shoot():
	var shoot_bullet = bullet.instantiate()
	if sprite.flip_h == true:
		shoot_bullet.direction = Vector2.LEFT
	if sprite.flip_h == false:
		shoot_bullet.direction = Vector2.RIGHT
	shoot_bullet.p_shooter = player_character
	owner.add_child(shoot_bullet)
	shoot_bullet.global_position = $Marker2D.global_position
	$Cooldown.start()
	shoot_cooldown = true


func _on_cooldown_timeout():
	shoot_cooldown = false

func check_weapon():
	if (weapon_sprite.texture == preload("res://Asset/Item/water_gun_full_auto.png")):
		$Cooldown.wait_time = 0.2
		if Input.is_action_pressed("atk_2") and shoot_cooldown == false:
			shoot()
			number_bullet -= 1
			if number_bullet <= 0:
				weapon_sprite.texture = preload("res://Asset/Item/GunWater_lv1.png")
	if (weapon_sprite.texture == preload("res://Asset/Item/GunWater_lv1.png")):
		$Cooldown.wait_time = 0.5
		if Input.is_action_just_pressed("atk_2") and shoot_cooldown == false:
			shoot()
