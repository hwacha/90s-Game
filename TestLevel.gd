extends Spatial

onready var cave_mesh = $ViewportContainer/Viewport/RealisticCave2/RootNode/Cube026
onready var player = $ViewportContainer/Viewport/Player

func _process(delta):
	cave_mesh.get_surface_material(0).set_shader_param("player_position", player.transform.origin)
