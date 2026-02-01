class_name PuzzleResource
extends Resource

@export var question_text: String
@export var answer_texts: Array[String]
@export var page_textures: Array[Texture2D]

func _init(p_question_text = "", p_answer_texts = [], p_pages = []):
	question_text = p_question_text
	answer_texts.assign(p_answer_texts)
	page_textures.assign(p_pages)
