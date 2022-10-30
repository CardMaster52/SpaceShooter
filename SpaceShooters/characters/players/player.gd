extends Area2D
class_name player

signal spawn_laser(location)

onready var muzzle = $muzzle

var speed = 300

var input_vector = Vector2.ZERO

var hp = 3

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	global_position += input_vector * speed * delta 
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func take_damage(damage):
	hp -= damage
	if hp <=0:
		queue_free()

func _on_player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)

func shoot():
	emit_signal("spawn_laser",muzzle.global_position)
