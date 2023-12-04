extends RigidBody2D

signal clicked

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			emit_signal("clicked", self)
