@tool
extends PanelContainer

@export_file("*.svg") var icon:
    set(_icon):
        icon = _icon
        $Column/Icon.texture = load(icon)

@export var english: String = "English":
    set(_english):
        english = _english
        $Column/English.text = english

@export var kana: String = "かな":
    set(_kana):
        kana = _kana
        $Column/Kana.text = kana
        
@export var kanji: String = "漢字":
    set(_kanji):
        kanji = _kanji
        $Column/Kanji.text = kanji

@export var show_kana = true:
    set(_show_kana):
        show_kana = _show_kana
        $Column/Kana.visible = show_kana
        $Column/Kanji.visible = not show_kana

func _on_button_pressed() -> void:
    var voices = DisplayServer.tts_get_voices_for_language("jp")
    if not voices.is_empty():
        if kanji == "":
            DisplayServer.tts_speak(kana, voices[0])
        else:
            DisplayServer.tts_speak(kanji, voices[0])
