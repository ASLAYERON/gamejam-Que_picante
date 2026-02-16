extends CharacterBody2D

## VARIABELS
const SPEED = 500.0
## FONCTIONS
func movement(delta):
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		if abs(velocity.x) < SPEED:
			velocity.x += SPEED * delta * direction_x
		else:
			velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		if abs(velocity.y) < SPEED:
			velocity.y += SPEED  * delta * direction_y
		else:
			velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
## MAIN LOOP
func _physics_process(delta: float) -> void:

	movement(delta)
	move_and_slide()
