extends Area2D

signal enemy_death

export (int) var speed = 150

var hp = 1

func _physics_process(delta):
	global_position.y += speed * delta

func take_damage(damage):
	hp -= damage
	if hp <=0:
		queue_free()
		emit_signal("enemy_death")




func _on_enemy_area_entered(area):
	if area is player:
		area.take_damage(1)
