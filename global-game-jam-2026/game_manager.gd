extends Node2D

@export var draggable_area: CanvasLayer
@export var puzzle_data: Array[PuzzleResource]
@export var message_decryption: MessageDecryption

var current_puzzle_index:int = 0
var all_draggables: Array[CanvasItem]

var draggable_scene = load("res://draggable.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	message_decryption.send_answers.connect(check_answer)
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

func check_answer(is_correct: bool) -> void:
	print(is_correct) #TODO track score!
	current_puzzle_index += 1
	if current_puzzle_index < puzzle_data.size():
		load_puzzle(current_puzzle_index)
	else:
		game_end()
		
func game_end() -> void:
	print("Game over!")
	
func _on_answer_correct_debug_button_down() -> void:
	check_answer(true)
