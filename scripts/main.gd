extends Node3D

var original_mouse_mode = Input.mouse_mode
var currentMosquito
var obstacles
var randomGenerator = RandomNumberGenerator.new()

signal debug(message:String)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	obstacles = get_tree().get_nodes_in_group("obstacles")

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

func _process(delta):
	if !self.currentMosquito:
		self._next_mosquito()

func _next_mosquito():
	if self.currentMosquito and self.currentMosquito.isPlaying():
		self.currentMosquito.stop()
	
	var mosquitoUpdated = false
	while not mosquitoUpdated:
		var newMosquito = self.obstacles[self.randomGenerator.randi_range(0, self.obstacles.size() - 1)]
		
		if newMosquito != self.currentMosquito:
			self.currentMosquito = newMosquito
			mosquitoUpdated = true
	
	if self.currentMosquito and not self.currentMosquito.isPlaying():
		self.currentMosquito.play()
	
func smash(target):
	if target == self.currentMosquito:
		print("smashed")
		self._next_mosquito()
	else:
		print("miss")
