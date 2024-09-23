extends PanelContainer

@export var title = "TITLE":
    set(_title):
        title = _title
        $VBox/Scroll/VBox/Title.text = "- " + title + " -"

@export_file("*.json") var json_file

const Card = preload("res://vocabulary/common/card.tscn")
const Grid = preload("res://vocabulary/common/grid.tscn")
const Section = preload("res://vocabulary/common/section.tscn")

func _ready():
    # read json
    var string = FileAccess.get_file_as_string(json_file)
    var list = JSON.parse_string(string)
    
    # parse json
    for element in list:
        if element.has("section"):
            create_section(element["section"])
        else: # create card
            create_card(element)
                
func create_section(section_text):
    var section = Section.instantiate()
    section.text = "\n" + section_text
    $VBox/Scroll/VBox.add_child(section)

func create_card(card_info):
    # create card instance
    var card = Card.instantiate()
    card.english = card_info["english"]
    card.kana = card_info["kana"]
    card.kanji = card_info["kanji"]
    card.icon = card_info["icon"]
    # add to scene
    var control = $VBox/Scroll/VBox.get_child(-1)
    if control is not GridContainer:
        control = Grid.instantiate()
        $VBox/Scroll/VBox.add_child(control)
    control.add_child(card)

func _on_back_pressed() -> void:
    Events.on_back_pressed.emit()
