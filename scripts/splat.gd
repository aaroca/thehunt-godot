extends TextureRect

var hidding = false

func _process(delta):
	if self.visible and not hidding:
		$splatTimer.start()
		self.hidding = true

func _hide():
	self.visible = false
	self.hidding = false
