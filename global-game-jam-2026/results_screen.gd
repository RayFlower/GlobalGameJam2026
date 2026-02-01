extends Node2D

@onready var result_stat = $"result stat"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_result_stat()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



## --- Functions --------------------------------------------

func set_result_stat() -> void:
	
	# Get stats
	var _solved_cyphers = 0
	var _total_cyphers = 99
	
	# set text to display
	result_stat.text = str(_solved_cyphers) + " / " + str(_total_cyphers)
	pass



## --- Signals ----------------------------------------------

func _on_retry_button_pressed() -> void:
	# Restart the game
	get_tree().change_scene_to_file("res://Main.tscn")
	pass # Replace with function body.
