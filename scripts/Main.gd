extends Node2D

func _ready():
	# Hardcoded configuration
	$Yieldot.NameTextLabel.rect_position = Vector2(100, 20)
	$Yieldot.RichText.rect_position = Vector2(100, 60)
	$Yieldot.Prompt.rect_position = Vector2(100, 90)
	
	# Initialize question to user
	$Yieldot.set_speaker("Narrator")
	$Yieldot.prompt("Hello world! What's your name?", "Bernovel")
	yield($Yieldot, "prompt_finish")
	
	# Create Character
	var MC = $Yieldot.create_character($Yieldot.get_prompt())
	
	# Initialize first message
	MC.says(["Hello World!", "This is an amazing game!"])
	MC.show_sprite("res://images/character/Happy.png", Vector2(250, -200))
	yield(MC, "says_finish")
	
	# Hide Yieldot upon finish
	$Yieldot/Textbox.hide()