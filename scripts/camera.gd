extends Camera3D

@export var mouse_sens:float = 0.3
var camera_anglev:float = 0

func _input(event):
	if event is InputEventMouseMotion:
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-50 and camera_anglev+changev<50:
			camera_anglev+=changev
			rotate_x(deg_to_rad(changev))
