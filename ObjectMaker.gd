extends Node2D

const OBJECT_SCENES: Dictionary[Constants.ObjectType, PackedScene] = {
	Constants.ObjectType.BULLET_PLAYER: preload("res://scenes/Bullets/PlayerBullet.tscn"),
	Constants.ObjectType.BULLET_ENEMY: preload("res://scenes/Bullets/EnemyBullet.tscn"),
	Constants.ObjectType.EXPLOSION: preload("res://Explosion.tscn"),
	Constants.ObjectType.PICKUP: preload("res://FruitPickup.tscn"),
}

func _enter_tree() -> void:
	SignalHub.on_create_bullet.connect(on_create_bullet)
	SignalHub.on_create_object.connect(on_create_object)

func on_create_bullet(pos: Vector2, dir: Vector2, speed: float, ob_type: Constants.ObjectType) -> void:
	if !OBJECT_SCENES.has(ob_type):
		return
		
	var nb: Bullet = OBJECT_SCENES[ob_type].instantiate()
	call_deferred("add_child", nb)
	nb.call_deferred("setup", pos, dir, speed)

func on_create_object(pos: Vector2, ob_type: Constants.ObjectType) -> void:
	if !OBJECT_SCENES.has(ob_type):
		return
	var new_obj: Node2D = OBJECT_SCENES[ob_type].instantiate()
	call_deferred("_setup_object", new_obj, pos)

func _setup_object(obj: Node2D, pos: Vector2) -> void:
	add_child(obj)
	obj.global_position = pos
