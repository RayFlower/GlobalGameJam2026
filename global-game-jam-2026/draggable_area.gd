extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# This assumes all draggable nodes are already in the scene -bryan
	for child in get_children():
		child.on_drag_start.connect(move_dragged_node_to_top)

func move_dragged_node_to_top(dragged: Node) -> void:
	var top_index = get_child_count() - 1
	move_child(dragged, top_index)
