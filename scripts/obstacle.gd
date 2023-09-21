extends RigidBody3D

signal select;
signal unselect;

func selectMesh():
	emit_signal("select")

func unselectMesh():
	emit_signal("unselect")

func play():
	$AudioStreamPlayer3D.play()
	
func stop():
	$AudioStreamPlayer3D.stop()

func isPlaying():
	return $AudioStreamPlayer3D.playing
