extends AnimatedSprite2D

@onready var sound: AudioStreamPlayer2D = $Sound

func _on_animation_finished() -> void:
	queue_free()

func _ready() -> void:
	sound.play()
