extends Control



var hovered_slots : Array = []

var is_item_selected :bool = false
var selected_item : StringName = "None"

@onready var inventory = $Inventory
@onready var minimap = $Minimap
@onready var mouse_item = $Mouse_item


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory.master = self
	minimap.master= self


func slot_pressed(slot):
	if slot.IS_INVENTORY :
		if not is_item_selected :
			if inventory.inv_contents[slot]["item"] != "None":
				pick_item(slot)
			else :
				inventory.change_inv(slot,"red")
		elif is_item_selected and inventory.inv_contents[slot]["item"] == "None":
			put_item(slot)
	elif not slot.IS_INVENTORY and is_item_selected :
		put_item(slot)

func pick_item(slot):
	is_item_selected = true
	selected_item = inventory.inv_contents[slot]["item"]
	mouse_item.set_item(inventory.inv_contents[slot]["item"])
	inventory.change_inv(slot,"None")

func put_item(slot):
	if slot.IS_INVENTORY :
		inventory.change_inv(slot,selected_item)
		mouse_item.set_item("None")
		is_item_selected = false
	else :
		for s in existing_slots(slot.vector):
			minimap.add_potion(s,selected_item)
			mouse_item.set_item("None")
			is_item_selected = false
		

func existing_slots(slot_vector:Vector2):
	var slots = []
	for vector in Global.item_data[selected_item]["area"]:
			if slot_vector+vector in minimap.rooms.keys() and selected_item not in minimap.rooms[slot_vector+vector]["potions"] :
				slots.append(slot_vector+vector)
	return slots


func slot_hovered(slot):
	if is_item_selected :
		var slot_vector = slot.vector
		for vector in existing_slots(slot_vector):
			minimap.rooms[vector]["slot"].start_hover()
			hovered_slots.append(minimap.rooms[vector]["slot"])
		


func slot_not_hovered(_slot):
	for s in hovered_slots:
		s.stop_hover()
	hovered_slots = []
