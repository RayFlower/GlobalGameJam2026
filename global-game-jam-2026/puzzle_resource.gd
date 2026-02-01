class_name PuzzleResource
extends Resource

@export var question_text: String
@export var all_comma_seperated_answer_texts: Array[String]
@export var page_textures: Array[Texture2D]

func _init(p_question_text = "", p_csv_answer_texts = [], p_pages = []):
	question_text = p_question_text
	all_comma_seperated_answer_texts.assign(p_csv_answer_texts)
	page_textures.assign(p_pages)
