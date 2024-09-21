extends Control

@onready var button = $Button

func _on_button_toggled(toggled_on: bool) -> void:
    if toggled_on:
        button.text = "あ"
    else:
        button.text = "字"
    for card in get_tree().get_nodes_in_group("cards"):
        card.show_kana = not toggled_on
