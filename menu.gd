extends Node2D

func _ready():
	SilentWolf.configure({
		"api_key": "eLIggd6nu78BNB46cEpfF3eukPEvK8Bb6RSolTgF",
		"game_id": "boxmaps",
		"log_level": 0
  	})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://menu.tscn"
  	})

	
func _on_button_pressed():
	#Globals.handle_start(boxes)
	#get_tree().change_scene_to_file("res://find_it.tscn")
	Globals.game_type = 1
	get_tree().change_scene_to_file("res://box_select.tscn")


func _on_button_2_pressed():
	#Globals.handle_start(boxes)
	#get_tree().change_scene_to_file("res://street_drill.tscn")
	Globals.game_type = 2
	get_tree().change_scene_to_file("res://box_select.tscn")
































