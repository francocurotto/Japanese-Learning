extends VBoxContainer

const open_texture = preload("res://assets/icons/common/section_open.svg")
const close_texture = preload("res://assets/icons/common/section_close.svg")

@export var text = "Section":
    set(_text):
        text = _text
        $Button.text = text

func add_child_to_grid(node: Node):
    $Grid.add_child(node)

func _on_button_toggled(toggled_on: bool) -> void:
    $Grid.visible = not toggled_on
    if toggled_on:
        $Button.icon = close_texture
    else:
        $Button.icon = open_texture
