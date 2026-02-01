class_name MessageDecryption
extends Node2D

## Object References
@onready var CipherText_1_text 			= $"Cipher Selection 1/Cipher Text"
@onready var CipherText_2_text 			= $"Cipher Selection 2/Cipher Text"
@onready var CipherText_3_text 			= $"Cipher Selection 3/Cipher Text"

## Parameters

## Instantiate
var cipher_1_index = 0
var cipher_2_index = 0
var cipher_3_index = 0

var cipher_1_answer_list = []
var cipher_2_answer_list = []
var cipher_3_answer_list = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assign_cipher_data()
	get_random_starting_selection()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



## --- Functions ------------------------------------------

func assign_cipher_data() -> void:
	# Assigns the current puzzle data from the game manager to the message decryptor object
	
	cipher_1_answer_list = [
		"hewwo",
		"0w0",
		"what's this?",
	]
	
	cipher_2_answer_list = [
		"fuck you",
		"fuck me",
		"no, fuck you!",
	]
	
	cipher_3_answer_list = [
		"1",
		"2",
		"3",
		"4",
		"5",
	]
	pass

func get_random_starting_selection() -> void:
	if(cipher_1_answer_list.size() == 0) : pass
	
	# Get random selection of answers and fill into selection fields
	cipher_1_index = randi_range(0, cipher_1_answer_list.size() - 1)
	cipher_2_index = randi_range(0, cipher_2_answer_list.size() - 1)
	cipher_3_index = randi_range(0, cipher_3_answer_list.size() - 1)
	
	# Get text from index
	CipherText_1_text.text = cipher_1_answer_list[cipher_1_index]
	CipherText_2_text.text = cipher_2_answer_list[cipher_2_index]
	CipherText_3_text.text = cipher_3_answer_list[cipher_3_index]
	pass



## --- BUTTON SIGNALS --------------------------------------

func _on_cypher1_button_previous_pressed() -> void:
	cipher_1_index = ((cipher_1_index - 1) + cipher_1_answer_list.size()) % cipher_1_answer_list.size()
	CipherText_1_text.text = cipher_1_answer_list[cipher_1_index]
	pass # Replace with function body.
	
func _on_cypher1_button_next_pressed() -> void:
	cipher_1_index = (cipher_1_index + 1) % cipher_1_answer_list.size()
	CipherText_1_text.text = cipher_1_answer_list[cipher_1_index]
	pass # Replace with function body.

func _on_cypher2_button_previous_pressed() -> void:
	cipher_2_index = ((cipher_2_index - 1) + cipher_2_answer_list.size()) % cipher_2_answer_list.size()
	CipherText_2_text.text = cipher_2_answer_list[cipher_2_index]
	pass # Replace with function body.
	
func _on_cypher2_button_next_pressed() -> void:
	cipher_2_index = (cipher_2_index + 1) % cipher_2_answer_list.size()
	CipherText_2_text.text = cipher_2_answer_list[cipher_2_index]
	pass # Replace with function body.

func _on_cypher3_button_previous_pressed() -> void:
	cipher_3_index = ((cipher_3_index - 1) + cipher_3_answer_list.size()) % cipher_3_answer_list.size()
	CipherText_3_text.text = cipher_3_answer_list[cipher_3_index]
	pass # Replace with function body.
	
func _on_cypher3_button_next_pressed() -> void:
	cipher_3_index = (cipher_3_index + 1) % cipher_3_answer_list.size()
	CipherText_3_text.text = cipher_3_answer_list[cipher_3_index]
	pass # Replace with function body.

func _on_send_button_pressed() -> void:
	## Submit answer to game manager
	
	pass # Replace with function body.
