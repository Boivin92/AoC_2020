extends Panel


func _ready():
	for child in $MarginContainer/Control/GridContainer.get_children():
		child.connect("answered", self, "_on_answer_given")

func _on_ClipboardButton_pressed():
	OS.set_clipboard($MarginContainer/Control/AnswerLine/LineEdit.text)
	$CenterContainer/AnimationPlayer.play("Show")

func _on_answer_given(answer):
	$MarginContainer/Control/AnswerLine/LineEdit.text = answer
