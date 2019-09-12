extends Node2D

signal click
signal enter
signal say_finish
signal prompt_finish
signal menu_finish

# Character
const Character = preload("res://scripts/Character.gd")

# Textbox
var buttons
var choice

# Shortcut for configuration
onready var NameTextLabel = $Textbox/NameTextLabel
onready var RichText = $Textbox/RichTextLabel
onready var Prompt = $Textbox/PromptEdit

func _ready():
	pass

# Character methods
func create_character(name):
	var Bernovel = Node2D.new()
	Bernovel.script = Character
	Bernovel.Yieldot = self
	Bernovel.character_name = name
	
	return Bernovel

# Background Controller
func set_background(texture):
	$Background.set_texture(texture)

# Sprite Controller
func add_sprite(texture, position, scale = Vector2(1, 1)):
	$Sprites.add_sprite(texture, position, scale)

# Textbox Controlelr
func set_text(text):
	$Textbox/RichTextLabel.text = text

func set_speaker(speaker):
	$Textbox/NameTextLabel.text = speaker

# Prompt
func prompt(question, default = ""):
	set_text(question)
	$Textbox/PromptEdit.text = default
	$Textbox/PromptEdit.show()
	
	yield(self, "enter")
	
	$Textbox/PromptEdit.hide()
	
	emit_signal("prompt_finish")

func get_prompt():
	return $Textbox/PromptEdit.text

# Menu - choices
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

# Event Listeners - on textbox clicked, prompt finished etc.
func _input(event):
	if not event.is_pressed():
		return
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		emit_signal("click")
		emit_signal("say_finish")
	
	if event is InputEventKey and event.scancode == KEY_ENTER:
		emit_signal("enter")
		emit_signal("say_finish")