extends Node

var boxes_used = []
var final_score = ''
var game_type = 0
var player

func handle_start(boxes):
	boxes_used = boxes
	
func finish_round(score):
	final_score = score
	
func change_scene():
	if game_type == 1:
		get_tree().change_scene_to_file("res://find_it.tscn")
	elif game_type == 2:
		get_tree().change_scene_to_file("res://street_drill.tscn")
	
	
