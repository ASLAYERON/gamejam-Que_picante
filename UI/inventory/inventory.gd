extends Control

var master : Node 


var inv_line = load("res://UI/minimap/minimap_line.tscn")
var inv_slot = load("res://UI/inventory/inventory_slot.tscn")

var INV_SIZE = Global.inv_rows
var WANTED_SIZE = Global.right_ui_size

var VIEW_SIZE

var inv_contents = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VIEW_SIZE = get_viewport().get_visible_rect().size
	initialize_size()
	var new_slot
	var new_line
	for i in range(INV_SIZE):
		new_line = inv_line.instantiate()
		add_child(new_line)
		for j in range(INV_SIZE):
			new_slot = inv_slot.instantiate()
			new_slot.master = self
			inv_contents[new_slot] = {"item":"None"}
			new_line.add_child(new_slot)
			if j == 0 :
				change_inv(new_slot,"red")
			elif j == 1:
				change_inv(new_slot,"other")


func initialize_size():
	size = Vector2(WANTED_SIZE,WANTED_SIZE)
	position.x = VIEW_SIZE.x-WANTED_SIZE-Global.ui_margin
	position.y = VIEW_SIZE.y-WANTED_SIZE-Global.ui_margin


func slot_pressed(slot):
	master.slot_pressed(slot)

func change_inv(slot:Node,item):
	if item == "None" :
		slot.content_texture.visible =false
	else :
		slot.content_texture.visible = true
		slot.set_item(item)
	inv_contents[slot]["item"] = item
