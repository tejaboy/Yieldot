extends Node2D

func _ready():
	resize()
	
	get_tree().get_root().connect("size_changed", self, "on_window_size_changed")
	$NameTextLabel.connect("item_rect_changed", self, "on_label_rect_changed")
	$RichTextLabel.connect("item_rect_changed", self, "on_label_rect_changed")

func resize():
	# Get the starting center point.
	var x = (get_viewport().get_size().x - $Background.rect_size.x) / 2
	
	# Get starting y position based on rect_size.
	var y = get_viewport().get_size().y - $Background.rect_size.y - 10
	
	# And ... finally set the position!
	global_position = Vector2(x, y)
	
	## Labels
	$RichTextLabel.rect_size = $Background.rect_size - Vector2($RichTextLabel.rect_position.x * 2, 0)

func on_window_size_changed():
	resize()

func on_label_rect_changed():
	resize()