extends Node2D

var height = 200
var width = 0

func _ready():
	on_window_size_changed()
	get_tree().get_root().connect("size_changed", self, "on_window_size_changed")

func on_window_size_changed():
	## Set size
	var _width = width
	
	if width == 0:
		_width = get_viewport().get_size().x
	
	$Background.rect_size = Vector2(_width, height)
	
	## Set position
	# Get the starting center point.
	var x = (get_viewport().get_size().x - $Background.rect_size.x) / 2
	
	# Get starting y position based on rect_size.
	var y = get_viewport().get_size().y - $Background.rect_size.y - 10
	
	# And ... finally set the position!
	global_position = Vector2(x, y)
	
	## Labels
	$RichTextLabel.rect_size = $Background.rect_size - Vector2(200, 0)