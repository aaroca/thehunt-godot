extends Camera3D

@export var mouse_sens:float = 0.3
var camera_anglev:float = 0
var selectedObject
var game_ended = false

func _input(event):
	if not self.game_ended:
		if event is InputEventMouseMotion:
			var changev=-event.relative.y*mouse_sens
			if camera_anglev+changev>-50 and camera_anglev+changev<50:
				camera_anglev+=changev
				rotate_x(deg_to_rad(changev))

func _physics_process(delta):
	if $raycast.is_colliding():
		var newSelectedObject = $raycast.get_collider()

		if newSelectedObject != selectedObject:
			if selectedObject:
				selectedObject.unselectMesh()
			
			selectedObject = newSelectedObject
			selectedObject.selectMesh()
	elif selectedObject:
		selectedObject.unselectMesh()
		selectedObject = null
