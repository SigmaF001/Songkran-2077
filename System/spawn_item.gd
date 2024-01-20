extends Node2D

@onready var gun_lv1 = preload("res://Asset/gun.png")
@onready var Tomyum = preload("res://Asset/Item/Tomyum.png")
@onready var Gun = preload("res://Asset/gun.png")

var data_list = ["gun_lv1", "Tomyum", "Gun"]

func _on_timer_timeout():
	start_spawn()

func start_spawn():
	data_list.shuffle()
	var item = data_list[0]
	var spawn_item = item.instantiate()
