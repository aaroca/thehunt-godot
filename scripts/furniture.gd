extends RigidBody3D

var meshName

func _ready():
	for child in self.get_children():
		if child.name.contains("mesh-"):
			meshName = child.name.replace("mesh-", "")

func mesh_name():
	return self.meshName

func play():
	$AudioStreamPlayer3D.play()
	
func stop():
	$AudioStreamPlayer3D.stop()

func isPlaying():
	return $AudioStreamPlayer3D.playing
