extends Node2D

const ENEMY_BULLET = preload("res://scenes/Bullets/EnemyBullet.tscn")
const PLAYER_BULLET = preload("res://scenes/Bullets/PlayerBullet.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("test"):
		var b = PLAYER_BULLET.instantiate()
		add_child(b)
