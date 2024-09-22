extends Button

@export_file("*.json") var json

func _on_pressed() -> void:
    Events.on_main_button_pressed.emit(text, json)
