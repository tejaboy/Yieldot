extends Node2D

func _ready():
	# Hardcoded configuration
	$Yieldot.NameTextLabel.rect_position = Vector2(100, 20)
	$Yieldot.RichText.rect_position = Vector2(100, 60)
	
	# Initialize first message
	$Yieldot.show()
	$Yieldot.set_speaker("Bernovel")
	$Yieldot.set_text("Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!Hello world!")
	$Yieldot.add_sprite("res://images/character/Confident.png", Vector2(650, 400), Vector2(0.75, 0.75))