extends Area2D

@export var next_scene: String

func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		change_scene()

func change_scene() -> void:
	get_tree().change_scene_to_file(next_scene)
