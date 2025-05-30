extends Camera3D

@export var mouse_sens:float = 0.3
var camera_anglev:float = 0
var selectedObject
var game_ended = false

func _input(event):
	if not self.game_ended:
		if event is InputEventMouseMotion:
			var changev=-event.relative.y*mouse_sens
			if camera_anglev+changev>-100 and camera_anglev+changev<50:
				camera_anglev+=changev
				rotate_x(deg_to_rad(changev))
	else:
		if event.is_action_pressed("ui_tab") and not $creditsScreen.visible:
			$creditsScreen.visible = true

func _physics_process(delta):
	if $raycast.is_colliding():
		var newSelectedObject = $raycast.get_collider()

		if newSelectedObject != selectedObject:
			if selectedObject:
				$object.text = ""
			
			selectedObject = newSelectedObject
			$object.text = selectedObject.mesh_name()
	elif selectedObject:
		$object.text = ""
		selectedObject = null
