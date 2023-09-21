extends RigidBody3D

signal select;
signal unselect;

func selectMesh():
	emit_signal("select")

func unselectMesh():
	emit_signal("unselect")
