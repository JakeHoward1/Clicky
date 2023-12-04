extends Label

@export var score = 0

func _ready():
	self.text  = "Score: 0"

func _process(_delta):
	self.text  = "Score: " + str(GameVariables.score)
		
		
