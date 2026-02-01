class_name Draggable
extends Container

@onready var flip_button:Button = $HBoxContainer/FlipButton
var button_pressed:bool = false
var previous_mouse_position:Vector2 = Vector2.ZERO

var main_texture:Texture2D = null
var flipped_texture:Texture2D = null
var is_flipped = false

var is_cypher = false

signal on_drag_start

func initialize(new_main: Texture): #, new_flipped: Texture):
	main_texture = new_main
	$HBoxContainer/Texture.texture = main_texture
	#flipped_texture = new_flipped
	
	is_cypher = main_texture.resource_path.contains("cypher") #Incredible hacks -bryan
	hide_flip_button()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed:
		var current_mouse_position = get_viewport().get_mouse_position()
		var mouse_delta = current_mouse_position - previous_mouse_position
		position += mouse_delta
		previous_mouse_position = current_mouse_position
		
func hide_flip_button() -> void:
	$HBoxContainer/FlipButton.visible = false

func _on_drag_button_button_down() -> void:
	button_pressed = true
	previous_mouse_position = get_viewport().get_mouse_position()
	if is_cypher:
		flip_button.visible = true;
	on_drag_start.emit(self)

func _on_drag_button_button_up() -> void:
	button_pressed = false

func _on_flip_button_pressed() -> void:
	if is_cypher:
		$HBoxContainer/Texture.flip_h = !$HBoxContainer/Texture.flip_h
	else:
		if is_flipped:
			$HBoxContainer/Texture.texture = main_texture
		else:
			$HBoxContainer/Texture.texture = flipped_texture
