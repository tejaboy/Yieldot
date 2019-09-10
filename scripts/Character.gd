extends Node2D

var character_name
var Yieldot

signal say_finish
signal says_finish

func _ready():
	pass

func say(msg):
	Yieldot.get_node("Textbox").show()
	Yieldot.set_speaker(character_name)
	Yieldot.set_text(msg)
	
	yield(Yieldot, "say_finish")
	
	emit_signal("say_finish")

func says(msgs):
	for msg in msgs:
		say(msg)
		
		yield(self, "say_finish")
	
	emit_signal("says_finish")