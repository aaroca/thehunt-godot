extends Node3D

var original_mouse_mode = Input.mouse_mode
var currentMosquito
var furniture
var randomGenerator = RandomNumberGenerator.new()
var game_ended = false

signal debug(message:String)
signal smashed_mosquito
signal missed_mosquito

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	furniture = get_tree().get_nodes_in_group("furniture")

func _input(event):
	if event.is_action_pressed("ui_exit"):
		get_tree().quit()
	elif event.is_action_pressed("restart"):
		get_tree().reload_current_scene()

func _process(delta):
	#if !self.currentMosquito:
		#self._next_mosquito()
	pass

func _next_mosquito():
	if not self.game_ended:
		if self.currentMosquito and self.currentMosquito.isPlaying():
			self.currentMosquito.stop()
		
		var mosquitoUpdated = false
		while not mosquitoUpdated:
			var newMosquito = self.furniture[self.randomGenerator.randi_range(0, self.furniture.size() - 1)]
			
			if newMosquito != self.currentMosquito:
				self.currentMosquito = newMosquito
				mosquitoUpdated = true
		
		if self.currentMosquito and not self.currentMosquito.isPlaying():
			self.currentMosquito.play()
	
func smash(target):
	if target == self.currentMosquito:
		emit_signal("smashed_mosquito")
		self._next_mosquito()
	else:
		emit_signal("missed_mosquito")

func _set_gameover():
	self.game_ended = true
	if self.currentMosquito and self.currentMosquito.isPlaying():
			self.currentMosquito.stop()
