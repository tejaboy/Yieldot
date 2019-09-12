extends TextureRect

func _ready():
	on_window_size_changed()
	get_tree().get_root().connect("size_changed", self, "on_window_size_changed")

func on_window_size_changed():
	rect_size = get_viewport().get_size()