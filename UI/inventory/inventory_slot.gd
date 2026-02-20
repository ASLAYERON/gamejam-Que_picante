extends Control


var master : Node

const IS_INVENTORY :bool = true

@onready var content_texture = $MarginContainer/ContentTexture
@onready var slot_texture = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slot_texture.initialize(load(Global.inv_slot_texture))


func set_item(item:StringName):
	content_texture.initialize(load(Global.item_data[item]["image"]))


func _on_button_pressed() -> void:
	master.slot_pressed(self)
