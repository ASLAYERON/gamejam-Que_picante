extends Control


var master : Node


const IS_INVENTORY :bool = false

@onready var texture_rect = $TextureRect
@onready var modulate_color = texture_rect.modulate


var vector : Vector2


func initialize(level:String):
	texture_rect.initialize(load("res://niveaux/test/"+level+"/image.gif"))

func add_potion(potion):
	modulate = modulate.lerp(Global.item_data[potion]["color"],0.5)

func start_hover():
	texture_rect.modulate = modulate.darkened(0.25)

func stop_hover():
	texture_rect.modulate = modulate_color

func _on_button_pressed() -> void:
	master.slot_pressed(self)


func _on_button_mouse_entered() -> void:
	master.slot_hovered(self)

func _on_button_mouse_exited() -> void:
	master.slot_not_hovered(self)
