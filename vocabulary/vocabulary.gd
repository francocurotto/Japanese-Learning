@tool
extends PanelContainer

@export var title = "TITLE":
    set(_title):
        title = _title
        $VBox/Scroll/VBox/Title.text = "- " + title + " -"

@export_file("*.json") var json_file

const Card = preload("res://vocabulary/common/card.tscn")

func _ready():
    # read json
    var string = FileAccess.get_file_as_string(json_file)
    var list = JSON.parse_string(string)
    
    # parse json
    for element in list:
        if element.has("section"):
            create_section(element)
        else: # create card
            create_card(element)
                
func create_section(_section):
    pass

func create_card(card_info):
    var card = Card.instantiate()
    card.english = card_info["english"]
    card.kana = card_info["kana"]
    card.kanji = card_info["kanji"]
    card.icon = card_info["icon"]
    $VBox/Scroll/VBox/Grid.add_child(card)

func _on_back_pressed() -> void:
    Events.on_back_pressed.emit()
