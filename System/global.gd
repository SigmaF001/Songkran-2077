extends Node

var p_1_score = 0
var p_2_score = 0

var foods = ["Tomyum", "Somtum"]
var want_food
var random = false

func _ready():
	foods.shuffle()
	want_food = foods[0]

func _physics_process(delta):
	random
	
func random_foods():
	if random:
		foods.shuffle()
		want_food = foods[0]
		random = false
