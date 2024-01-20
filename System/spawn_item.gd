extends Node2D

#@onready var Tomyum = preload("res://Asset/Item/Tomyum.png")
@onready var GunFullAuto = preload("res://Object/Weapons/water_gun_full_auto.tscn")

func _on_timer_timeout():
	start_spawn()

func start_spawn():
	var data_list = [GunFullAuto]
	data_list.shuffle()
	var item = data_list[0]
	var spawn_item = item.instantiate()
	add_child(spawn_item)
