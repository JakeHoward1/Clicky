extends Label

signal out_of_time
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(int($MinuteTimer.time_left))



func _on_minute_timer_timeout():
	out_of_time.emit()
