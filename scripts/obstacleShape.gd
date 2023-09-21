extends MeshInstance3D

@onready var outlineShader = preload("res://shader/outline.gdshader")

func on_select():
	var outlineShaderMaterial = ShaderMaterial.new()
	outlineShaderMaterial.shader = outlineShader
	self.mesh.surface_get_material(0).next_pass = outlineShaderMaterial
	
func on_unselect():
	self.mesh.surface_get_material(0).next_pass = null
