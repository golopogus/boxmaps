extends Node2D

func _ready():
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete

	print("Scores: " + str(sw_result.scores))
	#print(sw_result.scores[0]["score"])
	print(len(sw_result.scores))
	for i in len(sw_result.scores):
		
		$names.get_child(i).text = sw_result.scores[i]["player_name"]
		i += 1
		
		
