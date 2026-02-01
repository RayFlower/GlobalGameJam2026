extends CanvasLayer

func add_new_draggable(new_draggable: Draggable) -> void:
	add_child(new_draggable)
	new_draggable.on_drag_start.connect(move_dragged_node_to_top)

func move_dragged_node_to_top(dragged: Node) -> void:
	var top_index = get_child_count() - 1
	move_child(dragged, top_index)
