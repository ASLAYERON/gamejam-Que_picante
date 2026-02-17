extends Control

@onready var texture_rect = $TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func initialize(level:String):
	texture_rect.initialize(load("res://niveaux/test/"+level+"/image.gif"))
