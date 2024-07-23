class_name IntentUI
extends HBoxContainer

@onready var icon: TextureRect = $Icon
@onready var text: Label = $Text

func update_intent(intent: Intent) -> void:
	if not intent:
		hide()
		return
	
	icon.texture = intent.icon
	icon.visible = icon.texture != null
	text.text = str(intent.current_text)
	text.visible = intent.current_text.length() > 0
	show()
