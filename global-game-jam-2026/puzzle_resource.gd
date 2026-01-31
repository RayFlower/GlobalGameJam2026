class_name PuzzleResource
extends Resource

@export var question_text: String
@export var answer_texts: Array[String]
@export var pages_to_reveal: Array[String]

func _init(p_question_text = "", p_answer_texts = [], p_pages = []):
	question_text = p_question_text
	answer_texts.assign(p_answer_texts)
	pages_to_reveal.assign(p_pages)
