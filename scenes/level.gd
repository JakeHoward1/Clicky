extends Node2D


#prepacked scenes so they can be instantiated later
var coin_scene : PackedScene = preload("res://scenes/objects/coin.tscn")
var bad_coin_scene : PackedScene = preload("res://scenes/objects/bad_coin.tscn")

func _ready():
	$BackgroundSong.play()
	
#This function runs everytime the timer hits 0 (runs every 0.3 seconds)
func _on_spawn_timer_timeout():
	

	# All this below is randomizing and instantiating coins and spawning them
	var x_direction1 : int = -1 + (randi() % 3)
	var y_direction1 : int = -7 - (randi() % 3)
	
	var x_direction2 : int = -1 + (randi() % 3)
	var y_direction2 : int = -7 - (randi() % 3)
	
	var x_direction3 : int = -1 + (randi() % 3)
	var y_direction3 : int = -7 - (randi() % 3)
	
	var x_direction4 : int = -1 + (randi() % 3)
	var y_direction4 : int = -7 - (randi() % 3)
	
	var x_direction5 : int = -1 + (randi() % 3)
	var y_direction5 : int = -7 - (randi() % 3)
	
	var direction1 : Vector2 = Vector2(x_direction1,y_direction1).normalized()
	var direction2 : Vector2 = Vector2(x_direction2,y_direction2).normalized()
	var direction3 : Vector2 = Vector2(x_direction3,y_direction3).normalized()
	var direction4 : Vector2 = Vector2(x_direction4,y_direction4).normalized()
	var direction5 : Vector2 = Vector2(x_direction5,y_direction5).normalized()
	
	var spawns = $CoinSpawns.get_children()
		
	var coin1 = coin_scene.instantiate() as RigidBody2D
	coin1.linear_velocity = direction1 * 1000
	coin1.position = spawns[randi() % spawns.size()].position
	
	var coin2 = coin_scene.instantiate() as RigidBody2D
	coin2.linear_velocity = direction2 * 1000
	coin2.position = spawns[randi() % spawns.size()].position
	
	var coin3 = coin_scene.instantiate() as RigidBody2D
	coin3.linear_velocity = direction3 * 1000
	coin3.position = spawns[randi() % spawns.size()].position
	
	var coin4 = coin_scene.instantiate() as RigidBody2D
	coin4.linear_velocity = direction4 * 1000
	coin4.position = spawns[randi() % spawns.size()].position
		
	var badCoin = bad_coin_scene.instantiate() as RigidBody2D
	badCoin.linear_velocity = direction5 * 1000
	badCoin.position = spawns[randi() % spawns.size()].position
		
	var coins = [coin1, coin2, coin3, coin4, badCoin]
	
	var selectedCoin : RigidBody2D = coins[randi() % coins.size()]

	if selectedCoin == badCoin:
		selectedCoin.connect("clicked", _on_bad_coin_clicked)
	else:
		selectedCoin.connect("clicked", _on_coin_clicked)
#	selectedCoin.input_event.connect(_on_input_event)
		
#	pressed.connect(_on_pressed.bind(selectedCoin))
	$LiveCoins.add_child(selectedCoin)
	
#	for selecteedCoin
#		button.pressed.connect(_on_pressed.bind(button))

func _on_coin_clicked(coin):
	GameVariables.score += 1
	$Counter.score += 1
	print("PRINTED")
	$LiveCoins.remove_child(coin)
	$CoinPickUpSFX.play()
#			if event.button_index == MOUSE_BUTTON_LEFT:
#				print("yay3")
#				if get_viewport_rect().has_point(to_local(event.position)):
#					print("event")


func _on_bad_coin_clicked(coin):
	GameVariables.score -= 5
	$Counter.score -= 5
	$LiveCoins.remove_child(coin)
	$BadCoinSFX.play()
#			if event.button_index == MOUSE_BUTTON_LEFT:
#				print("yay3")
#				if get_viewport_rect().has_point(to_local(event.position)):
#					print("event")

#This was for testing, not exactly whats going on.



func _on_countdown_timer_out_of_time():
	get_tree().change_scene_to_file("res://scenes/UI/game_over.tscn")
