extends Node2D

var camera_move = false
var mouse_loc = Vector2()
var mouse_check = Vector2()
var highlighted_street = ''
var boxes = []
var list_of_streets = []
var current_street = ''
var selected_street = ''
var rand_num
var score = 0
var add_score = 0
var move = false

#func _on_button_pressed():
	#for streets in get_node("map/41008").get_children():
	#	list_of_streets.append(streets.name)
	#randomize_street()
	#move = true
	#$CanvasLayer/Button.queue_free()
	
func _ready():
	for box in $map.get_children():
		for street in box.get_children():
			for item in street.get_children():
				if "sprite" in item.name:
					item.visible = false
	boxes = Globals.boxes_used
	
	for box in boxes:
		for streets in get_node("map/" + str(box)).get_children():
			if streets.name not in list_of_streets:
				list_of_streets.append(streets.name)
	
	randomize_street()
	move = true
	#$CanvasLayer/Button.queue_free()
			
		
func randomize_street():
	rand_num = randi() % len(list_of_streets)-1
	current_street = list_of_streets[rand_num]
	adjust_text(current_street)
	
func adjust_text(street):
	street = street.replace('_',' ')
	$CanvasLayer/Label.text = street
	$Timer.start()
	#dd_score = 1000
	
#func _process(delta):
	#pass


	
		
##############MAP MOVEMENT#############

func _unhandled_input(event):
	if move == true:
		###PAN###
		if event is InputEventMagnifyGesture:
			$map_camera.zoom = $map_camera.zoom * event.factor
		
		###ZOOM###
		if Input.is_action_just_pressed("mouse_click"):
			mouse_loc = get_global_mouse_position() - $map.position
			mouse_check = get_global_mouse_position()
			
		if Input.is_action_pressed("mouse_click"):
			camera_move = true
		else:
			camera_move = false
			
		if camera_move == true:
			$map.position =  get_global_mouse_position() - mouse_loc
		
		###SELECT STREET###
		if Input.is_action_just_released("mouse_click"):
			if mouse_check == get_global_mouse_position() and highlighted_street != '':
				selected_street += highlighted_street
				check_answer(selected_street)
			

func check_answer(street):
	if street != current_street:
		add_score = -500
	if street == current_street:
		add_score = 1000*($Timer.time_left/$Timer.wait_time)
		if add_score < 100:
			add_score = 100
		list_of_streets.erase(current_street)
		randomize_street()
	
	if add_score < 0:
		add_score = str(int(add_score))
	else:
		add_score = '+' + str(int(add_score))
	$Sprite2D2/added.text = add_score
	$Sprite2D2.visible = true
	$Sprite2D2.position = get_global_mouse_position() + Vector2(40,0)
	$AnimationPlayer.play("score")
	$CanvasLayer/Label2.text = str(round(float($CanvasLayer/Label2.text) + float(add_score)))
	add_score = 0
	selected_street = ''
		
func highlight_street(street_name,box,vis):
	if vis == true:
		highlighted_street += street_name
	else: 
		highlighted_street = ''
	for boxes in $map.get_children():
		if boxes.name == box:
			for streets in get_node("map/" + box).get_children():
				if streets.name == street_name:
					get_node("map/" + box + "/" + street_name + "/" + street_name + "_sprite").visible = vis
					
func _on_timer_timeout():
	pass
	

	
#########STREETS##########

###Carey Park Lane###
func _on_carey_park_lane_area_mouse_entered():
	highlight_street('carey_park_lane','41000',true)
func _on_carey_park_lane_area_mouse_exited():
	highlight_street('carey_park_lane','41000',false)

###Madison Watch Way###
func _on_madison_watch_way_area_mouse_entered():
	highlight_street('madison_watch_way','41000',true)
func _on_madison_watch_way_area_mouse_exited():
	highlight_street('madison_watch_way','41000',false)

###Signal Knob Court###
func _on_signal_knob_court_area_mouse_entered():
	highlight_street('signal_knob_court','41000',true)
func _on_signal_knob_court_area_mouse_exited():
	highlight_street('signal_knob_court','41000',false)
	
###Powell Lane###
func _on_powell_lane_area_mouse_entered():
	highlight_street('powell_lane','41000',true)
func _on_powell_lane_area_mouse_exited():
	highlight_street('powell_lane','41000',false)
	
###Pinetree Terrace###
func _on_pinetree_terrace_area_mouse_entered():
	highlight_street('pinetree_terrace','41000',true)
func _on_pinetree_terrace_area_mouse_exited():
	highlight_street('pinetree_terrace','41000',false)
	
###Madison View Lane###
func _on_madison_view_lane_area_mouse_entered():
	highlight_street('madison_view_lane','41000',true)
func _on_madison_view_lane_area_mouse_exited():
	highlight_street('madison_view_lane','41000',false)
	
##Nevius Street###
func _on_nevius_street_area_mouse_entered():
	highlight_street('nevius_street','41000',true)
func _on_nevius_street_area_mouse_exited():
	highlight_street('nevius_street','41000',false)

###Marshall Drive###
func _on_marshall_drive_area_mouse_entered():
	highlight_street('marshall_drive','41000',true)
func _on_marshall_drive_area_mouse_exited():
	highlight_street('marshall_drive','41000',false)

###Steppes Court###
func _on_steppes_court_area_mouse_entered():
	highlight_street('steppes_court','41000',true)
func _on_steppes_court_area_mouse_exited():
	highlight_street('steppes_court','41000',false)

###Madison Point Court###
func _on_madison_point_court_area_mouse_entered():
	highlight_street('madison_point_court','41000',true)
func _on_madison_point_court_area_mouse_exited():
	highlight_street('madison_point_court','41000',false)

###Madison Park Drive###
func _on_madison_park_drive_area_mouse_entered():
	highlight_street('madison_park_drive','41000',true)
func _on_madison_park_drive_area_mouse_exited():
	highlight_street('madison_park_drive','41000',false)

###Madison Overlook Court###
func _on_madison_overlook_court_area_mouse_entered():
	highlight_street('madison_overlook_court','41000',true)
func _on_madison_overlook_court_area_mouse_exited():
	highlight_street('madison_overlook_court','41000',false)

###Madison Lane###
func _on_madison_lane_area_mouse_entered():
	highlight_street('madison_lane','41000',true)
func _on_madison_lane_area_mouse_exited():
	highlight_street('madison_lane','41000',false)

###Madison Crest Court###
func _on_madison_crest_court_area_mouse_entered():
	highlight_street('madison_crest_court','41000',true)
func _on_madison_crest_court_area_mouse_exited():
	highlight_street('madison_crest_court','41000',false)

###Jefferson Hill Court###
func _on_jefferson_hill_court_area_mouse_entered():
	highlight_street('jefferson_hill_court','41000',true)
func _on_jefferson_hill_court_area_mouse_exited():
	highlight_street('jefferson_hill_court','41000',false)

###Ambrose Hills Road###
func _on_ambrose_hills_road_area_mouse_entered():
	highlight_street('ambrose_hills_road','41000',true)
func _on_ambrose_hills_road_area_mouse_exited():
	highlight_street('ambrose_hills_road','41000',false)

###Beachway Drive###
func _on_beachway_drive_area_mouse_entered():
	highlight_street('beachway_drive','41000',true)
func _on_beachway_drive_area_mouse_exited():
	highlight_street('beachway_drive','41000',false)

###Blair Road###
func _on_blair_road_area_mouse_entered():
	highlight_street('blair_road','41000',true)
func _on_blair_road_area_mouse_exited():
	highlight_street('blair_road','41000',false)

###Boat Dock Drive###
func _on_boat_dock_drive_area_mouse_entered():
	highlight_street('boat_dock_drive','41000',true)
func _on_boat_dock_drive_area_mouse_exited():
	highlight_street('boat_dock_drive','41000',false)

###Duff Drive###
func _on_duff_drive_area_mouse_entered():
	highlight_street('duff_drive','41000',true)
func _on_duff_drive_area_mouse_exited():
	highlight_street('duff_drive','41000',false)

###Edgewater Drive###
func _on_edgewater_drive_area_mouse_entered():
	highlight_street('edgewater_drive','41000',true)
func _on_edgewater_drive_area_mouse_exited():
	highlight_street('edgewater_drive','41000',false)

###Glen Carlyn Drive###
func _on_glen_carlyn_drive_area_mouse_entered():
	highlight_street('glen_carlyn_drive','41000',true)
func _on_glen_carlyn_drive_area_mouse_exited():
	highlight_street('glen_carlyn_drive','41000',false)

###Gordon Street###
func _on_gordon_street_area_mouse_entered():
	highlight_street('gordon_street','41000',true)
func _on_gordon_street_area_mouse_exited():
	highlight_street('gordon_street','41000',false)

###Greentree Drive###
func _on_greentree_drive_area_mouse_entered():
	highlight_street('greentree_drive','41000',true)
func _on_greentree_drive_area_mouse_exited():
	highlight_street('greentree_drive','41000',false)

###Lake Street###
func _on_lake_street_area_mouse_entered():
	highlight_street('lake_street','41000',true)
func _on_lake_street_area_mouse_exited():
	highlight_street('lake_street','41000',false)

###Malibu Circle###
func _on_malibu_circle_area_mouse_entered():
	highlight_street('malibu_circle','41000',true)
func _on_malibu_circle_area_mouse_exited():
	highlight_street('malibu_circle','41000',false)

###Mansfield Road###
func _on_mansfield_road_area_mouse_entered():
	highlight_street('mansfield_road','41000',true)
func _on_mansfield_road_area_mouse_exited():
	highlight_street('mansfield_road','41000',false)



#############################################################
#############################################################
#############################################################

#41008#

###Tyler Street###
func _on_tyler_street_area_mouse_entered():
	highlight_street('tyler_street','41008',true)
func _on_tyler_street_area_mouse_exited():
	highlight_street('tyler_street','41008',false)


func _on_argyle_drive_area_mouse_entered():
	highlight_street('argyle_drive','41008',true)
func _on_argyle_drive_area_mouse_exited():
	highlight_street('argyle_drive','41008',false)

func _on_aura_court_area_mouse_entered():
	highlight_street('aura_court','41008',true)
func _on_aura_court_area_mouse_exited():
	highlight_street('aura_court','41008',false)


func _on_bellview_drive_area_mouse_entered():
	highlight_street('bellview_drive','41008',true)
func _on_bellview_drive_area_mouse_exited():
	highlight_street('bellview_drive','41008',false)

func _on_boston_drive_area_mouse_entered():
	highlight_street('boston_drive','41008',true)
func _on_boston_drive_area_mouse_exited():
	highlight_street('boston_drive','41008',false)

func _on_brill_court_area_mouse_entered():
	highlight_street('brill_court','41008',true)
func _on_brill_court_area_mouse_exited():
	highlight_street('brill_court','41008',false)

func _on_carlyn_court_area_mouse_entered():
	highlight_street('carlyn_court','41008',true)
func _on_carlyn_court_area_mouse_exited():
	highlight_street('carlyn_court','41008',false)

func _on_charles_street_area_mouse_entered():
	highlight_street('charles_street','41008',true)
func _on_charles_street_area_mouse_exited():
	highlight_street('charles_street','41008',false)

func _on_chicamuxen_court_area_mouse_entered():
	highlight_street('chicamuxen_court','41008',true)
func _on_chicamuxen_court_area_mouse_exited():
	highlight_street('chicamuxen_court','41008',false)

func _on_church_street_area_mouse_entered():
	highlight_street('church_street','41008',true)
func _on_church_street_area_mouse_exited():
	highlight_street('church_street','41008',false)

func _on_courtland_drive_area_mouse_entered():
	highlight_street('courtland_drive','41008',true)
func _on_courtland_drive_area_mouse_exited():
	highlight_street('courtland_drive','41008',false)

func _on_culmore_court_area_mouse_entered():
	highlight_street('culmore_court','41008',true)
func _on_culmore_court_area_mouse_exited():
	highlight_street('culmore_court','41008',false)

func _on_durbin_place_area_mouse_entered():
	highlight_street('durbin_place','41008',true)
func _on_durbin_place_area_mouse_exited():
	highlight_street('durbin_place','41008',false)

func _on_freedom_place_area_mouse_entered():
	highlight_street('freedom_place','41008',true)
func _on_freedom_place_area_mouse_exited():
	highlight_street('freedom_place','41008',false)

func _on_garland_drive_area_mouse_entered():
	highlight_street('garland_drive','41008',true)
func _on_garland_drive_area_mouse_exited():
	highlight_street('garland_drive','41008',false)

func _on_glenmore_drive_area_mouse_entered():
	highlight_street('glenmore_drive','41008',true)
func _on_glenmore_drive_area_mouse_exited():
	highlight_street('glenmore_drive','41008',false)

func _on_glen_forest_drive_area_mouse_entered():
	highlight_street('glen_forest_drive','41008',true)
func _on_glen_forest_drive_area_mouse_exited():
	highlight_street('glen_forest_drive','41008',false)

func _on_haven_place_area_mouse_entered():
	highlight_street('haven_place','41008',true)
func _on_haven_place_area_mouse_exited():
	highlight_street('haven_place','41008',false)

func _on_kaywood_drive_area_mouse_entered():
	highlight_street('kaywood_drive','41008',true)
func _on_kaywood_drive_area_mouse_exited():
	highlight_street('kaywood_drive','41008',false)

func _on_kaywood_place_area_mouse_entered():
	highlight_street('kaywood_place','41008',true)
func _on_kaywood_place_area_mouse_exited():
	highlight_street('kaywood_place','41008',false)

func _on_knollwood_drive_area_mouse_entered():
	highlight_street('knollwood_drive','41008',true)
func _on_knollwood_drive_area_mouse_exited():
	highlight_street('knollwood_drive','41008',false)

func _on_longbranch_drive_area_mouse_entered():
	highlight_street('longbranch_drive','41008',true)
func _on_longbranch_drive_area_mouse_exited():
	highlight_street('longbranch_drive','41008',false)

func _on_longwood_drive_area_mouse_entered():
	highlight_street('longwood_drive','41008',true)
func _on_longwood_drive_area_mouse_exited():
	highlight_street('longwood_drive','41008',false)

func _on_lucky_court_area_mouse_entered():
	highlight_street('lucky_court','41008',true)
func _on_lucky_court_area_mouse_exited():
	highlight_street('lucky_court','41008',false)

func _on_magnolia_avenue_area_mouse_entered():
	highlight_street('magnolia_avenue','41008',true)
func _on_magnolia_avenue_area_mouse_exited():
	highlight_street('magnolia_avenue','41008',false)

func _on_maple_court_area_mouse_entered():
	highlight_street('maple_court','41008',true)
func _on_maple_court_area_mouse_exited():
	highlight_street('maple_court','41008',false)

func _on_payne_street_area_mouse_entered():
	highlight_street('payne_street','41008',true)
func _on_payne_street_area_mouse_exited():
	highlight_street('payne_street','41008',false)

func _on_peace_valley_lane_area_mouse_entered():
	highlight_street('peace_valley_lane','41008',true)
func _on_peace_valley_lane_area_mouse_exited():
	highlight_street('peace_valley_lane','41008',false)
	
func _on_pensa_drive_area_mouse_entered():
	highlight_street('pensa_drive','41008',true)
func _on_pensa_drive_area_mouse_exited():
	highlight_street('pensa_drive','41008',false)

func _on_red_pine_street_area_mouse_entered():
	highlight_street('red_pine_street','41008',true)
func _on_red_pine_street_area_mouse_exited():
	highlight_street('red_pine_street','41008',false)

func _on_vista_drive_area_mouse_entered():
	highlight_street('vista_drive','41008',true)
func _on_vista_drive_area_mouse_exited():
	highlight_street('vista_drive','41008',false)

func _on_washington_drive_area_mouse_entered():
	highlight_street('washington_drive','41008',true)
func _on_washington_drive_area_mouse_exited():
	highlight_street('washington_drive','41008',false)
	
func _on_wilkins_drive_area_mouse_entered():
	highlight_street('wilkins_drive','41008',true)
func _on_wilkins_drive_area_mouse_exited():
	highlight_street('wilkins_drive','41008',false)


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
