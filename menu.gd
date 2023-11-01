extends Node2D

var boxes = []


func _on_button_41000_pressed():
	if 41000 in boxes:
		boxes.erase(41000)
	else:
		boxes.append(41000)


func _on_button_41008_pressed():
	if 41008 in boxes:
		boxes.erase(41008)
	else:
		boxes.append(41008)
		
func _on_button_41011_pressed():
	if 41011 in boxes:
		boxes.erase(41011)
	else:
		boxes.append(41011)
		
func _on_button_41012_pressed():
	if 41012 in boxes:
		boxes.erase(41012)
	else:
		boxes.append(41012)
		
func _on_button_41096_pressed():
	if 41097 in boxes:
		boxes.erase(41096)
	else:
		boxes.append(41096)
			
func _on_button_41097_pressed():
	if 41097 in boxes:
		boxes.erase(41097)
	else:
		boxes.append(41097)


func _on_button_pressed():
	Globals.handle_start(boxes)
	get_tree().change_scene_to_file("res://find_it.tscn")


func _on_button_2_pressed():
	Globals.handle_start(boxes)
	get_tree().change_scene_to_file("res://street_drill.tscn")









