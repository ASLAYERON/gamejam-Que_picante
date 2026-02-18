extends Node2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		var coord_string = String(get_parent().name)
		print(coord_string)
		var coord_x = int(coord_string[0])
		var coord_y = int(coord_string[2])+1
		Global.tp_offset = Vector2(body.position.x,-900)
		get_tree().change_scene_to_file(Global.levels_map[Global.active_level][coord_y][coord_x]+"room.tscn")
