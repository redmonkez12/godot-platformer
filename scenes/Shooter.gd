extends Node2D

class_name Shooter

@onready var sound = $Sound
@onready var shoot_timer = $ShootTimer

@export var speed: float = 50.0
@export var life_span: float = 10.0
@export var bullet_key: Constants.ObjectType = Constants.ObjectType.BULLET_PLAYER
@export var shoot_delay: float = 0.7

var _can_shoot: bool = true

func _ready():
	shoot_timer.wait_time = shoot_delay

func shoot(direction: Vector2) -> void:
	if not _can_shoot:
		return
	
	_can_shoot = false
	SignalHub.emit_on_create_bullet(global_position, direction, speed, bullet_key)
	shoot_timer.start()
	sound.play()

func _on_shoot_timer_timeout():
	_can_shoot = true
