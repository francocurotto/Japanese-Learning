@tool
extends PanelContainer

@export_file("*.svg") var icon :
    set(_icon):
        icon = _icon
        $Column/Icon.texture = load(icon)

@export var english_text: String = "English":
    set(_english_text):
        english_text = _english_text
        $Column/English.text = english_text

@export var kana_text: String = "かな":
    set(_kana_text):
        kana_text = _kana_text
        $Column/Kana.text = kana_text
        
@export var kanji_text: String = "漢字":
    set(_kanji_text):
        kanji_text = _kanji_text
        $Column/Kanji.text = kanji_text

@export var show_kana = false:
    set(_show_kana):
        show_kana = _show_kana
        $Column/Kana.visible = show_kana
        $Column/Kanji.visible = not show_kana
