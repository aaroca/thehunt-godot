extends Node3D

var original_mouse_mode = Input.mouse_mode

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event.is_action_pressed("ui_exit"):
		get_tree().quit()
	elif event.is_action_pressed("ui_tab"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = self.original_mouse_mode
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
