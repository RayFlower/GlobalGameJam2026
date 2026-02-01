extends CanvasLayer

func add_new_draggable(new_draggable: Draggable) -> void:
	add_child(new_draggable)
	new_draggable.on_drag_start.connect(start_new_drag)

func start_new_drag(dragged: Draggable) -> void:
	var top_index = get_child_count() - 1
	move_child(dragged, top_index)

	for child in get_children():
		if child != dragged:
			child.hide_flip_button()
