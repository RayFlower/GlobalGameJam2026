extends Node2D

@export var draggable_area: CanvasLayer
@export var puzzle_data: Array[PuzzleResource]
@export var message_decryption: MessageDecryption

@export var correct_ticket_texture: Texture2D
@export var wrong_ticket_texture: Texture2D

var current_puzzle_index:int = 0
var all_draggables: Array[CanvasItem]

var draggable_scene = load("res://draggable.tscn")

var random_spawn_x = 1000
var random_spawn_y = 700

var ticket_spawn = Vector2(1600,800)

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
		instantiate_new_draggable(page_texture, false)

func check_answer(is_correct: bool) -> void:
	print("Answer is " + str(is_correct) + "!")
	
	var is_last_puzzle = current_puzzle_index == puzzle_data.size() - 1
	if(is_last_puzzle):
		is_correct = true

	spawn_answer_result_ticket(is_correct)
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
	
func spawn_answer_result_ticket(is_correct: bool) -> void:
	
	var texture_to_use:Texture2D
	if is_correct:
		texture_to_use = correct_ticket_texture
	else:
		texture_to_use = wrong_ticket_texture
	instantiate_new_draggable(texture_to_use, true)
	
func instantiate_new_draggable(draggable_texture:Texture2D, is_ticket:bool) -> void:
	var new_draggable = draggable_scene.instantiate() as Draggable
	new_draggable.initialize(draggable_texture) #, page_texture) #TODO this is a placeholder, replace with second sflipped texture
	
	var new_position:Vector2
	if is_ticket:
		var random_x = randi_range(ticket_spawn.x - 50, ticket_spawn.x + 50)
		var random_y = randi_range(ticket_spawn.y - 50, ticket_spawn.y + 50)
		new_position = Vector2(random_x, random_y)
	else:	
		var random_x = randi_range(0,random_spawn_x)
		var random_y = randi_range(0,random_spawn_y)
		new_position = Vector2(random_x, random_y)
	
	new_draggable.position = new_position
	draggable_area.add_new_draggable(new_draggable)
	
	
func _on_answer_correct_debug_button_down() -> void:
	check_answer(true)
