extends Node2D

var laser = preload("res://laser/PlayerLaser.tscn")

var score = 0

func _on_player_spawn_laser(location):
	var l = laser.instance()
	l.global_position = location
	add_child(l)
	
func score():
	score += 1 
	$Score.text = "SCORE : " + str(score)
	

