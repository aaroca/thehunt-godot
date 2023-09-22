extends MeshInstance3D

var outlineShaderMaterial = ShaderMaterial.new()
var originalMaterial = self.mesh.surface_get_material(0)

func _ready():
	outlineShaderMaterial.shader = preload("res://shader/outline.gdshader")

func on_select():
	var outlinedMaterial = self.originalMaterial.duplicate()
	outlinedMaterial.next_pass = self.outlineShaderMaterial
	self.material_override = outlinedMaterial
	
func on_unselect():
	self.material_override = originalMaterial
