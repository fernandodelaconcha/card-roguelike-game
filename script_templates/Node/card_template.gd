# meta-name: Card Logic
# meta-description: What happens when a card is played.
class_name MyCard
extends Card

@export var optional_sound: AudioStream

func apply_effects(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	print("My awesome card is played")
	print("Targets: %s" % targets)
