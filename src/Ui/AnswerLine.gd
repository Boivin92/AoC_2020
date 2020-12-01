extends HBoxContainer


func _ready():
	pass


func _on_Button_pressed():
	OS.set_clipboard($LineEdit.text)
