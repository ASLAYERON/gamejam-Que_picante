extends Control

@onready var texture_rect = $TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_viewport().get_mouse_position()

func set_item(item):
	if item == "None":
		visible = false
	else :
		visible = true
		texture_rect.initialize(load(Global.item_data[item]["image"]))
