extends Node2D

func _ready():
	pass

func add_sprite(texture, position, scale):
	var sprite = Sprite.new()
	sprite.texture = load(texture)
	sprite.centered = false
	sprite.position = position
	sprite.scale = scale
	
	add_child(sprite)
	
	return sprite