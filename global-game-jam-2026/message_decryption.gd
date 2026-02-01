class_name MessageDecryption
extends Node2D

## Object References
@onready var CipherText_1_text 			= $"Cipher Selection 1/Cipher Text"
@onready var CipherText_2_text 			= $"Cipher Selection 2/Cipher Text"
@onready var CipherText_3_text 			= $"Cipher Selection 3/Cipher Text"
@onready var CipherText_4_text			= $"Cipher Selection 4/Cipher Text"

@onready var all_cipher_texts = [CipherText_1_text,CipherText_2_text,CipherText_3_text,CipherText_4_text]
@onready var all_cipher_controls = [$"Cipher Selection 1", $"Cipher Selection 2",$"Cipher Selection 3",$"Cipher Selection 4"]

var cipher_1_index = 0
var cipher_2_index = 0
var cipher_3_index = 0
var cipher_4_index = 0

var cipher_1_answer_list = []
var cipher_2_answer_list = []
var cipher_3_answer_list = []
var cipher_4_answer_list = []

var all_cipher_lists = [cipher_1_answer_list,cipher_2_answer_list,cipher_3_answer_list,cipher_4_answer_list]
var current_correct_answers = ["","","",""]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



## --- Functions ------------------------------------------

func assign_cipher_data(all_answers_texts: Array[String]) -> void:
	# Assigns the current puzzle data from the game manager to the message decryptor object
	
	for cipher_control in all_cipher_controls:
		cipher_control.visible = false
	
	var current_index = 0
	for answers_text in all_answers_texts:
		var answers_split:Array[String]
		answers_split.assign(answers_text.split(","))
		current_correct_answers[current_index] = answers_split[0]
		
		answers_split.shuffle()
		all_cipher_lists[current_index].assign(answers_split)
		all_cipher_controls[current_index].visible = true
		all_cipher_texts[current_index].text = answers_split[0]
		
		current_index += 1
	

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
	
func _on_cypher4_button_previous_pressed() -> void:
	cipher_4_index = ((cipher_4_index - 1) + cipher_4_answer_list.size()) % cipher_4_answer_list.size()
	CipherText_4_text.text = cipher_4_answer_list[cipher_4_index]
	pass # Replace with function body.
	
func _on_cypher4_button_next_pressed() -> void:
	cipher_4_index = (cipher_4_index + 1) % cipher_4_answer_list.size()
	CipherText_4_text.text = cipher_4_answer_list[cipher_4_index]
	pass # Replace with function body.

func _on_send_button_pressed() -> void:
	## Submit answer to game manager
	
	pass # Replace with function body.
