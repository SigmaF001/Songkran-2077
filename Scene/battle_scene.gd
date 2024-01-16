extends Node2D

@onready var player_1_score = $CanvasLayer/P1Score
@onready var player_2_score = $CanvasLayer/P2Score
@onready var display_second = $CanvasLayer/BoxContainer/Second
@onready var display_minute = $CanvasLayer/BoxContainer/Minute

@export var player_1 : CharacterBody2D
@export var player_2 : CharacterBody2D

var minute : int
var second : int

func _ready():
	minute = 0
	second = 10

func _process(delta):
	time()
	display_second.text = str(second)
	display_minute.text = str(minute)
	game_over()
	all_player_score()
	
func time():
	if second == 0:
		minute -= 1
		second = 60

func _on_time_fight_timeout():
	second -= 1

func game_over():
	if minute == 0 and second == 0:
		get_tree().change_scene_to_file("res://Scene/result_screen.tscn")

func all_player_score():
	player_1_score.text = str(player_1.score)
	player_2_score.text = str(player_2.score)
