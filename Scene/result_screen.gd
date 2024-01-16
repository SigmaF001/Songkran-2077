extends Node2D

var player_1_score = Global.p_1_score
var player_2_score = Global.p_2_score

func _ready():
	$HBoxContainer/P1Score.text = str(player_1_score)
	$HBoxContainer2/P2Score.text = str(player_2_score)

func _physics_process(delta):
	if player_1_score > player_2_score:
		$Conclusion.text = "Player 1 has win!"
	if player_1_score < player_2_score:
		$Conclusion.text = "Player 2 has win!"
	if player_1_score == player_2_score:
		$Conclusion.text = "Draw!"
