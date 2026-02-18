extends CharacterBody2D

## VARIABELS
const SPEED = 500.0
var tween = create_tween()
var is_walking = false
var was_walking = false
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
	if direction_y >= 0:
		$sprites/PlayerSpriteBack.visible = false
		$sprites/PlayerSpriteFace.visible = true
		
	else :
		$sprites/PlayerSpriteBack.visible = true
		$sprites/PlayerSpriteFace.visible = false
	if direction_x >= 0: 
		$sprites/PlayerSpriteFace.flip_h = false
		$sprites/PlayerSpriteBack.flip_h = false
	else : 
		$sprites/PlayerSpriteFace.flip_h = true
		$sprites/PlayerSpriteBack.flip_h = true
	
	if direction_x or direction_y: is_walking = true
	else: is_walking = false
	if !was_walking && is_walking:
		print("sart_walking")
		reset_tween()
		tween.set_loops()
		tween.tween_property($sprites,"scale",Vector2(1,0.8),0.3)
		tween.tween_property($sprites,"scale",Vector2(1,1),0.3)
	if was_walking && !is_walking:
		print("stopped walking")
		reset_tween()
		$sprites.scale = Vector2(1,1)
	was_walking = is_walking

func reset_tween():
	if tween:
		tween.kill()
		tween = create_tween()

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
