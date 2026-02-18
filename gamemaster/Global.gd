extends Node

var levels_data = {	#les niveaux sont carrées, lenght = width
	"test": {
		"size": 3
	}
}
var levels_map = {
	"test":[
		["res://niveaux/test/0_0/","res://niveaux/test/1_0/"],
	]
}

var active_level = "test"


var right_ui_size = 256
var ui_margin = 8
var inv_rows = 3
var inv_slot_texture = "res://assets/ui/inventory_slot.gif"


var item_data = { # Tout les items qui peuvent etre dans l'inventaire
	"red" = {
		"name" : "Red Potion",
		"image" : "res://assets/items/potion_rouge.gif",
		"area" : [Vector2(0,0)],
		"color" : Color.CRIMSON,
	},
	"other" = {
		"name":"Weird Potion",
		"image":"res://assets/items/potion4.gif",
		"area" : [Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,-1),Vector2(0,1)],
		"color" : Color.BLUE,
	},
}
