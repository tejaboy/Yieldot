# weisen
Godot Visual Novel Example

# Getting Started

## Prerequisites

1. [Godot Engine](https://godotengine.org/)

## Installation

1. Clone the repo
2. Open up Godot Engine
3. Import Project

## Usage

### Nodes Setup
Root  
| Yieldot (Node2D)  
  | Background (TextureRect)  
  | Sprites (Node2D)  
  | Textbox (Node2D)  
    | Background (TextureRect)  
	| NameTextLabel (RichTextLabel)  
	| RichTextLabel (RichTextLabel)  
	| PromptEdit (TextEdit)  

### Configure Visual Node position through GDScript

```gdscript
$Yieldot.NameTextLabel.rect_position = Vector2(100, 20)
$Yieldot.RichText.rect_position = Vector2(100, 60)
$Yieldot.Prompt.rect_position = Vector2(100, 90)
```

## Sample Code

### Set Speaker, ask for input and retrive input.

```gdscript
$Yieldot.set_speaker("Narrator")
$Yieldot.prompt("Hello world! What's your name?", "Bernovel")
yield($Yieldot, "prompt_finish")
	
var player_name = $Yieldot.get_prompt()
```

### Create Character and use let Character 'speak'

```gdscript
var MC = $Yieldot.create_character($Yieldot.get_prompt())

# Initialize first message
MC.says(["Hello World!", "This is an amazing game!"])
MC.show_sprite("res://images/character/Happy.png", Vector2(250, -200))
yield(MC, "says_finish")
```

### $Yieldot vs Character

`$Yieldot` is the base class and provide low-level access to the visual element.  
`Character` provides higher level code for faster prototyping.

```gdscript
#$Yieldot
$Yieldot.set_speaker("Narrator")
$Yieldot.set_text("Hello world!")

#Character
var player = $Yieldot.create_character("Bernovel")
player.say("Hello world!")
```

The pros for using Character is that set_speaker does not need to be called again when there are multiple speakers speaking.

## Authors
* [tejaboy](https://github.com/tejaboy)

## License
This project is licensed under the GNU General Public License 3.0 - see the [LICENSE.md](https://github.com/tejaboy/Yieldot/blob/master/LICENSE) file for more details.
