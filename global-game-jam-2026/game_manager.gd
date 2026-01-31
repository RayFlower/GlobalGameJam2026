extends Node2D

@export var draggable_area: CanvasLayer
@export var puzzle_data: Array[PuzzleResource]

var current_puzzle_index:int = 0
var all_draggables: Array[CanvasItem]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# load all pages and ciphers
	var all_children = draggable_area.get_children()
	all_draggables.assign(all_children)
	
	# hide everything
	for draggable in all_draggables:
		draggable.visible = false
	
	load_pages(0)
	

func load_pages(index: int):
	var current_puzzle = puzzle_data[index]
	var page_names = current_puzzle.pages_to_reveal
	
	for page_name in page_names:
		for draggable in all_draggables:
			if draggable.name == page_name:
				draggable.visible = true

func on_correct_answer() -> void:
	current_puzzle_index = current_puzzle_index + 1
	load_pages(current_puzzle_index)
	
func _on_answer_correct_debug_button_down() -> void:
	on_correct_answer()
