extends Node2D

func _ready():
	# Hardcoded configuration
	$Yieldot.NameTextLabel.rect_position = Vector2(100, 20)
	$Yieldot.RichText.rect_position = Vector2(100, 60)
	
	# Create Character
	var Bernovel = $Yieldot.create_character("Bernovel")
	
	# Initialize first message
	Bernovel.says(["Hello World!", "This is an amazing game!"])
	yield(Bernovel, "says_finish")
	
	# Hide Yieldot upon finish
	$Yieldot/Textbox.hide()