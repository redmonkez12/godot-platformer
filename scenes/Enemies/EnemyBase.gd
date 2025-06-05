extends CharacterBody2D

class_name EnemyBase

const OFF_SCREEN_KILL_ME: float = 1000.0

@export var points: int = 1
@export var speed: float = 30.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var _gravity: float = 800.0
var _player_ref: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_player_ref = get_tree().get_first_node_in_group(Constants.PLAYER_GROUP)
	if _player_ref == null:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	fallen_off()	

func fallen_off() -> void:
	if global_position.y > OFF_SCREEN_KILL_ME:
		queue_free()

func flip_me() -> void:
	animated_sprite_2d.flip_h = _player_ref.global_position.x > global_position.x

func die() -> void:
	set_physics_process(false)
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	pass # Replace with function body.


func _on_hit_box_area_entered(area: Area2D) -> void:
	die()
