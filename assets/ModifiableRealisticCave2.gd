extends Spatial

onready var cave_mesh = $RootNode/Cube026;
onready var player = get_tree().get_root().get_node("ViewportContainer/Viewport/Player")

func _ready():
	pass

func _process(delta):
	
