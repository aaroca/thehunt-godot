extends ColorRect

var hidding = false

func _process(delta):
	if self.visible and not hidding:
		$titleTimer.start()
		self.hidding = true
		
	if not $titleTimer.is_stopped():
		$timer.text = str(ceili($titleTimer.time_left))

func _hide():
	self.visible = false
	self.hidding = false
