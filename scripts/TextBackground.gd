extends TextureRect

var height = 200
var width = 0

func _ready():
	pass

func show():
	var _width = width
	
	if width == 0:
		_width = get_viewport().get_size().x
	
	rect_size = Vector2(_width, height)
	
	# Get the starting center point.
	var x = (get_viewport().get_size().x - rect_size.x) / 2
	
	# Get starting y position based on rect_size.
	var y = get_viewport().get_size().y - rect_size.y - 10
	
	# And ... finally set the position!
	rect_position = Vector2(x, y)
	
	.show()