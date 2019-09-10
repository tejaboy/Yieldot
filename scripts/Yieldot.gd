extends Node2D

signal click
signal enter
signal say_finish
signal prompt_finish
signal menu_finish

var buttons
var choice

# Shortcut for configuration
onready var NameTextLabel = $Textbox/NameTextLabel
onready var RichText = $Textbox/RichTextLabel

func _ready():
	hide()

# Background
func set_background(texture):
	$Background.set_texture(texture)

# Textbox
func set_text(text):
	$Textbox/RichTextLabel.text = text

func set_speaker(speaker):
	$Textbox/NameTextLabel.text = speaker

func prompt(question, default = ""):
	set_text(question)
	
	$Textbox/TextEdit.text = default
	$Textbox/TextEdit.show()
	
	yield(self, "enter")
	
	$Textbox/TextEdit.hide()
	
	emit_signal("prompt_finish")

func get_prompt():
	return $Textbox/TextEdit.text

func menu(question, choices):
	buttons = []
	var i = 0
	
	set_text(question)
	
	for choice in choices:
		buttons.append(Button.new())
		buttons[i].set_position(Vector2(200, 40 * i))
		buttons[i].set_size(Vector2(880, 30))
		buttons[i].text = choice
		buttons[i].show()
		$Textbox/Buttons.add_child(buttons[i])
		
		buttons[i].connect("pressed", self, "_on_menu_click", [i])
		
		i += 1

func _on_menu_click(buttonID):
	choice = buttons[buttonID].text
	
	for button in $Textbox/Buttons.get_children():
		button.queue_free()
	
	emit_signal("menu_finish")

func get_choice():
	return choice

func _input(event):
	if not event.is_pressed():
		return
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		emit_signal("click")
		emit_signal("say_finish")
	
	if event is InputEventKey and event.scancode == KEY_ENTER:
		emit_signal("enter")
		emit_signal("say_finish")