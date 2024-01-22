extends Node2D

#@onready var Tomyum = preload("res://Asset/Item/Tomyum.png")
@onready var GunFullAuto = preload("res://Object/Weapons/water_gun_full_auto.tscn")
@onready var Somtum = preload("res://Object/foods/somtum.tscn")
@onready var Padkaproa = preload("res://Object/foods/Padkaproa.tscn")

func _physics_process(delta):
	pass

func _on_timer_timeout():
	start_spawn()

func start_spawn():
	var data_list = [GunFullAuto, Somtum, Padkaproa]
	data_list.shuffle()
	var item = data_list[0]
	var spawn_item = item.instantiate()
	owner.add_child(spawn_item)
