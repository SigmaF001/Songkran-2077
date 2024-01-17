extends Node2D

@onready var gun_lv1 = preload("res://Asset/gun.png")

var data_list = ["gun_lv1", "Tomyum"]

func _ready():
	pass # Replace with function body.
	

func _process(delta):
	data_list.shuffle()
	var item = data_list[0]
	var spawn_item = item.instantiate()

func _on_timer_timeout():
	pass # Replace with function body.
