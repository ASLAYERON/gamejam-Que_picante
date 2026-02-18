extends Control

var master : Node 

var WANTED_SIZE = Global.right_ui_size
var MAP_SIZE = Global.levels_data[Global.active_level]["size"]
var VIEW_SIZE 

var lines : Array = []
var slots : Array = []

var minimap_instance = load("res://UI/minimap/minimap_instance.tscn")
var line_instance = load("res://UI/minimap/minimap_line.tscn")

var rooms = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VIEW_SIZE = get_viewport().get_visible_rect().size
	initialize_size()
	var new_line
	var new_slot
	for i in range(MAP_SIZE):
		new_line = line_instance.instantiate()
		lines.append(new_line)
		add_child(new_line)
		for j in range(MAP_SIZE):
			new_slot = minimap_instance.instantiate()
			new_slot.master = self
			slots.append(new_slot)
			new_line.add_child(new_slot)
			new_slot.initialize(str(i)+"_"+str(j))
			rooms[Vector2(i,j)] = {"slot":new_slot, "potions":[]}
			new_slot.vector = Vector2(i,j)


func initialize_size():
	size = Vector2(WANTED_SIZE,WANTED_SIZE)
	position.x = VIEW_SIZE.x-WANTED_SIZE-Global.ui_margin
	position.y = Global.ui_margin

func add_potion(vector,potion):
	rooms[vector]["potions"].append(potion)
	rooms[vector]["slot"].add_potion(potion)



func slot_pressed(slot):
	master.slot_pressed(slot)

func slot_hovered(slot):
	master.slot_hovered(slot)

func slot_not_hovered(slot):
	master.slot_not_hovered(slot)
