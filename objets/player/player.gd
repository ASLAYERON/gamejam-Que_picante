extends CharacterBody2D

## VARIABELS
const SPEED = 500.0

## FONCTIONS
func movement(delta):
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		if abs(velocity.x) < SPEED:
			velocity.x += 2 * SPEED * delta * direction_x
		else:
			velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		if abs(velocity.y) < SPEED:
			velocity.y += 2 * SPEED  * delta * direction_y
		else:
			velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

## EVENT
func _on_smoothing_camera_timeout() -> void:
	$Camera2D.position_smoothing_enabled = true

## MAIN LOOP
func _ready() -> void:
	$Camera2D.position_smoothing_enabled = false
	position = Global.tp_offset
	var coord_string = String(get_parent().name)
	$coord.text = coord_string
	$timers/smoothing_camera.start()

func _physics_process(delta: float) -> void:
	movement(delta)
	move_and_slide()
