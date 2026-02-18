extends Node

var levels_data = {	#les niveaux sont carrées, lenght = width
	"test": {
		"size": 3
	}
}
var levels_map = {
	"test":[
		["res://niveaux/test/0_0/","res://niveaux/test/1_0/","res://niveaux/test/2_0/"],
		["res://niveaux/test/0_1/","res://niveaux/test/1_1/","res://niveaux/test/2_1/"],
		["res://niveaux/test/0_2/","res://niveaux/test/1_2/","res://niveaux/test/2_2/"],
	]
}

var active_level = "test"
var tp_offset = Vector2(0,0)

var item_data = { # Tout les items qui peuvent etre dans l'inventaire
	"red" = {
		"name" : "Red Potion",
		"image" : "res://assets/items/potion_rouge.gif",
		
	}
}
