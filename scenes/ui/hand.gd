class_name Hand
extends Container

# INFO card size must be also written in here
const CARD_SIZE := Vector2(26, 40)

@export var player: Player
@export var char_stats: CharacterStats
@export_group("Card Fanning")
@export var hand_curve: Curve
@export var rotation_curve: Curve
@export var max_rotation_degrees := 5
@export var x_sep := -10
@export var y_min := 0
@export var y_max := -15

@onready var card_ui := preload("res://scenes/card_ui/card_ui.tscn")

func add_card(card: Card) -> void:
	var new_card_ui := card_ui.instantiate()
	add_child(new_card_ui)
	new_card_ui.reparent_requested.connect(_on_card_ui_reparent_requested)
	new_card_ui.card = card
	new_card_ui.parent = self
	new_card_ui.char_stats = char_stats
	new_card_ui.player_modifiers = player.modifier_handler
	update_cards()

func discard_card(card: CardUI) -> void:
	card.queue_free()
	update_cards()

func disable_hand() -> void:
	for card in get_children():
		card.disabled = true

func update_cards() -> void:
	var cards := get_child_count()
	var all_cards_size := CARD_SIZE.x * cards + x_sep * (cards - 1)
	var final_x_sep := x_sep
	
	if all_cards_size > CARD_SIZE.x:
		final_x_sep = (size.x - CARD_SIZE.x * cards) / (cards - 1)
		all_cards_size = size.x
	
	var offset = (size.x - all_cards_size) / 2
	
	for i in cards:
		var card : CardUI = get_child(i)
		var y_multiplier := hand_curve.sample(1.0 / (cards - 1) * i)
		var rot_multiplier := rotation_curve.sample(1.0 / (cards - 1) * i)
		
		if cards == 1:
			y_multiplier = 0.0
			rot_multiplier = 0.0
		
		var final_x: float = offset + CARD_SIZE.x * i + final_x_sep * i
		var final_y: float = y_min + y_max * y_multiplier
		
		card.position = Vector2(final_x, final_y)
		card.rotation_degrees = max_rotation_degrees * rot_multiplier

func _on_card_ui_reparent_requested(child: CardUI) -> void:
	child.disabled = true
	child.reparent(self)
	var new_index := clampi(child.original_index, 0, get_child_count())
	child.set_deferred("disabled", false)
	
	update_cards()
