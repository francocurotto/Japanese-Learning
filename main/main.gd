extends PanelContainer

const Vocabulary = preload("res://vocabulary/vocabulary.tscn")

var page

func _ready():
    Events.on_main_button_pressed.connect(open_page)
    Events.on_back_pressed.connect(close_page)

func open_page(title, json_file):
    page = Vocabulary.instantiate()
    page.title = title
    page.json_file = json_file
    $VBox.visible = false
    add_child(page)

func close_page():
    page.queue_free()
    $VBox.visible = true
