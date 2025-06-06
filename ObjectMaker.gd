extends Node2D

const OBJECT_SCENES: Dictionary[Constants.ObjectType, PackedScene] = {
	Constants.ObjectType.BULLET_PLAYER: preload("res://scenes/Bullets/PlayerBullet.tscn"),
	Constants.ObjectType.BULLET_ENEMY: preload("res://scenes/Bullets/EnemyBullet.tscn"),
}

func _enter_tree() -> void:
	SignalHub.on_create_bullet.connect(on_create_bullet)

func on_create_bullet(pos: Vector2, dir: Vector2, speed: float, ob_type: Constants.ObjectType) -> void:
	if !OBJECT_SCENES.has(ob_type):
		return
		
	var nb: Bullet = OBJECT_SCENES[ob_type].instantiate()
	call_deferred("add_child", nb)
	nb.call_deferred("setup", pos, dir, speed)
