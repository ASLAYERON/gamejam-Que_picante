extends Control

@onready var texture_rect = $TextureRect


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_viewport().get_mouse_position()

func set_item(item):
	if item == "None":
		visible = false
	else :
		visible = true
		texture_rect.initialize(load(Global.item_data[item]["image"]))
