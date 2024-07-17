class_name RewardButton
extends Button

@export var reward_icon: Texture : set = set_reward_icon
@export var reward_text: String : set = set_reward_text

@onready var custom_icon: TextureRect = %Icon
@onready var custom_text: Label = %Text

func set_reward_icon(value: Texture) -> void:
	reward_icon = value
	if not is_node_ready():
		await  ready
	
	custom_icon.texture = reward_icon

func set_reward_text(value: String) -> void:
	reward_text = value
	if not is_node_ready():
		await  ready
	
	custom_text.text = reward_text

func _on_pressed() -> void:
	queue_free()
