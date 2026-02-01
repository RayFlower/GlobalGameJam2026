extends Node2D

@export var draggable_area: CanvasLayer
@export var puzzle_data: Array[PuzzleResource]
@export var message_decryption: MessageDecryption

var current_puzzle_index:int = 0
var all_draggables: Array[CanvasItem]

var draggable_scene = load("res://draggable.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_puzzle(0)
	
func load_puzzle(index: int):
	var current_puzzle = puzzle_data[index]
	var all_answers_array = current_puzzle.all_comma_seperated_answer_texts
	message_decryption.assign_cipher_data(all_answers_array)
	
	load_pages(current_puzzle.page_textures)

func load_pages(textures: Array[Texture2D]):

	for page_texture in textures:
		var new_draggable = draggable_scene.instantiate() as Draggable
		new_draggable.initialize(page_texture)
		#TODO set random position
		draggable_area.add_new_draggable(new_draggable)

func on_correct_answer() -> void:
	current_puzzle_index += 1
	load_puzzle(current_puzzle_index)
	
func _on_answer_correct_debug_button_down() -> void:
	on_correct_answer()
