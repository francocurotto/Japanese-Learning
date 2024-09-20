@tool
extends PanelContainer

@export var english_text: String = "English":
    set(_english_text):
        english_text = _english_text
        %English.text = english_text

@export var kana_text: String = "かな":
    set(_kana_text):
        kana_text = _kana_text
        %Kana.text = kana_text
        
@export var kanji_text: String = "漢字":
    set(_kanji_text):
        kanji_text = _kanji_text
        %Kanji.text = kanji_text

@export var show_kana = false:
    set(_show_kana):
        show_kana = _show_kana
        %Kana.visible = show_kana
        %Kanji.visible = not show_kana
