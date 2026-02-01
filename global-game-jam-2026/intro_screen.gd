extends Node2D

@export var draggable_area: CanvasLayer
var draggable_scene = load("res://draggable.tscn")
@export var main_menu_cypher_texture:Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize();
	var new_draggable = draggable_scene.instantiate() as Draggable
	new_draggable.initialize(main_menu_cypher_texture)
	new_draggable.position = Vector2(1200,700)
	draggable_area.add_new_draggable(new_draggable)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


## --- Signals ----------------------------------------------

func _on_start_button_pressed() -> void:
	# Start the game
	$"Click SFX".play()
	get_tree().change_scene_to_file("res://Main.tscn")
	pass # Replace with function body.
