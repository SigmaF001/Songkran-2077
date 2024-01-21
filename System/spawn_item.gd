extends Node2D

#@onready var Tomyum = preload("res://Asset/Item/Tomyum.png")
@onready var GunFullAuto = preload("res://Object/Weapons/water_gun_full_auto.tscn")
@onready var Somtum = preload("res://Object/foods/somtum.tscn")

func _physics_process(delta):
	pass

func random_position():
	self.global_position = (Vector2(randf_range(-200,200), randf_range(-100, 200)))

func _on_timer_timeout():
	start_spawn()

func start_spawn():
	random_position()
	var data_list = [GunFullAuto, Somtum]
	data_list.shuffle()
	var item = data_list[0]
	var spawn_item = item.instantiate()
	owner.add_child(spawn_item)
