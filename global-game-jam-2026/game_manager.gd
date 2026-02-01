extends Node2D

@export var draggable_area: CanvasLayer
@export var puzzle_data: Array[PuzzleResource]
@export var message_decryption: MessageDecryption

var current_puzzle_index:int = 0
var all_draggables: Array[CanvasItem]

var draggable_scene = load("res://draggable.tscn")

var random_spawn_x = 1000
var random_spawn_y = 700

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.total_puzzles = puzzle_data.size()
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
		new_draggable.initialize(page_texture, page_texture) #TODO this is a placeholder, replace with second sflipped texture
		var random_x = randi_range(0,random_spawn_x)
		var random_y = randi_range(0,random_spawn_y)
		new_draggable.position = Vector2(random_x, random_y)
		draggable_area.add_new_draggable(new_draggable)

func check_answer(is_correct: bool) -> void:
	print("Answer is " + str(is_correct) + "!")
	if (is_correct):
		Global.score += 1
	
	current_puzzle_index += 1
	if current_puzzle_index < puzzle_data.size():
		load_puzzle(current_puzzle_index)
	else:
		game_end()
		
func game_end() -> void:
	print("Game over!")
	get_tree().change_scene_to_file("res://Results Screen.tscn")
	
func _on_answer_correct_debug_button_down() -> void:
	check_answer(true)
