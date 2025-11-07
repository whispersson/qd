extends CharacterBody2D

@export var speed: float = 50.0
@onready var anim = $AnimatedSprite2D
var last_direction := "down"

func _physics_process(_delta):
	var input_vector = Vector2.ZERO

	var move_x = Input.get_action_strength("dch") - Input.get_action_strength("izq")
	var move_y = Input.get_action_strength("abj") - Input.get_action_strength("arb")

	if move_x != 0:
		move_y = 0
	elif move_y != 0:
		move_x = 0

	input_vector.x = move_x
	input_vector.y = move_y

	velocity = input_vector * speed
	var prev_position = position
	move_and_slide()
	var moved_distance = position.distance_to(prev_position)

	if input_vector != Vector2.ZERO:
		if moved_distance < 0.5:
			match last_direction:
				"right":
					anim.play("idle right")
				"left":
					anim.play("idle left")
				"top":
					anim.play("idle top")
				"down":
					anim.play("idle down")
		else:
			if input_vector.x > 0:
				anim.play("walk right")
				last_direction = "right"
			elif input_vector.x < 0:
				anim.play("walk left")
				last_direction = "left"
			elif input_vector.y < 0:
				anim.play("walk top")
				last_direction = "top"
			elif input_vector.y > 0:
				anim.play("walk down")
				last_direction = "down"
	else:
		match last_direction:
			"right":
				anim.play("idle right")
			"left":
				anim.play("idle left")
			"top":
				anim.play("idle top")
			"down":
				anim.play("idle down")
