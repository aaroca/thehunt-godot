extends Node3D

var original_mouse_mode = Input.mouse_mode
signal debug(message:String)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event.is_action_pressed("ui_exit"):
		get_tree().quit()
	elif event.is_action_pressed("ui_tab"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = self.original_mouse_mode
			emit_signal("debug", "Mouse free")
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			emit_signal("debug", "Mouse captured")
