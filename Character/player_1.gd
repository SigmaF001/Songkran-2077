extends CharacterBody2D

@export var speed : float = 300.0

@onready var sprite = $Sprite2D
@onready var weapon_sprite = $Weapon

var bullet = preload("res://System/bullet.tscn")
var score = 0
var gravity = 900
var direction
var jump_velocity = -600
var shoot_cooldown = false

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump_1") and is_on_floor():
		velocity.y = jump_velocity
	
	direction = Input.get_axis("left_1", "right_1")
	velocity.x = direction * speed
	
	if is_on_floor() and Input.is_action_just_pressed("down_1"):
		position.y += 1
	
	Global.p_1_score = score
	
	move_and_slide()
	reverse_gravity()
	facing_direction()
	shoot()

func reverse_gravity():
	if Input.is_action_just_pressed("r_gravity_1"):
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
	if Input.is_action_just_pressed("atk_1") and shoot_cooldown == false:
		var shoot_bullet = bullet.instantiate()
		if sprite.flip_h == true:
			shoot_bullet.direction = Vector2.LEFT
		if sprite.flip_h == false:
			shoot_bullet.direction = Vector2.RIGHT
		owner.add_child(shoot_bullet)
		shoot_bullet.global_position = $Marker2D.global_position
		$Cooldown.start()
		shoot_cooldown = true


func _on_cooldown_timeout():
	shoot_cooldown = false
