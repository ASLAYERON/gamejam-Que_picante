extends Control

const WANTED_SIZE = 256 
var MAP_SIZE = Global.levels_data[Global.active_level]["size"]
var VIEW_SIZE 

var lines : Array = []
var slots : Array = []

@onready var Vbox = $VBoxContainer

var minimap_instance = load("res://UI/minimap/minimap_instance.tscn")
var line_instance = load("res://UI/minimap/minimap_line.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VIEW_SIZE = get_viewport().get_visible_rect().size
	initialize_size()
	var new_line
	var new_slot
	for i in range(MAP_SIZE):
		new_line = line_instance.instantiate()
		lines.append(new_line)
		Vbox.add_child(new_line)
		for j in range(MAP_SIZE):
			new_slot = minimap_instance.instantiate()
			slots.append(new_slot)
			new_line.add_child(new_slot)
			new_slot.initialize(str(i)+"_"+str(j))


func initialize_size():
	size = Vector2(WANTED_SIZE,WANTED_SIZE)
	position.x = VIEW_SIZE.x-WANTED_SIZE
