extends Node2D

signal add_score

var spawn_positions = null

var Enemy = preload("res://characters/enemy/enemy.tscn")

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()

func spawn_enemy():
	var index = randi() % spawn_positions.size() 
	var enemy = Enemy.instance()
	enemy.global_position = spawn_positions[index].global_position
	enemy.connect("enemy_death", self, "enemy_death")
	add_child(enemy)
	

func _on_SpawnTimer_timeout():
	spawn_enemy() 
	
func enemy_death():
	emit_signal("add_score")
