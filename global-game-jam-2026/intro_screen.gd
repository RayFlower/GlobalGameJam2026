extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


## --- Signals ----------------------------------------------

func _on_start_button_pressed() -> void:
	# Start the game
	get_tree().change_scene_to_file("res://Main.tscn")
	pass # Replace with function body.
