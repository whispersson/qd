extends CharacterBody2D

@export var speed: float = 100.0
@onready var anim = $AnimatedSprite2D
var last_direction := "down"

func _physics_process(_delta):
	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("dch") - Input.get_action_strength("izq")
	input_vector.y = Input.get_action_strength("abj") - Input.get_action_strength("arb")
	input_vector = input_vector.normalized()

	velocity = input_vector * speed
	move_and_slide()

	if input_vector != Vector2.ZERO:
		if abs(input_vector.x) > abs(input_vector.y):
			anim.play("walk rl")
			anim.flip_h = input_vector.x < 0
			last_direction = "rl"
		elif input_vector.y < 0:
			anim.play("walk top")
			last_direction = "top"
		else:
			anim.play("walk down")
			last_direction = "down"
	else:
		match last_direction:
			"rl":
				anim.play("idle rl")
			"top":
				anim.play("idle top")
			"down":
				anim.play("idle down")
