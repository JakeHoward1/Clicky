extends Label

func _ready():
#	var scoreboard : Node2D = get_tree().get_root().get_node("Level/Counter")
	$Score.text =  "Score: " + str(GameVariables.score)
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/menu.tscn")
