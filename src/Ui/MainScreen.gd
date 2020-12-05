extends Panel

onready var Confirmation = $ConfirmationDialog

func _ready():
	for child in $MarginContainer/Control/GridContainer.get_children():
		child.connect("answered", self, "_on_answer_given")
		child.connect("custom_requested", self, "_on_custom_requested")

func _on_ClipboardButton_pressed():
	OS.set_clipboard($MarginContainer/Control/AnswerLine/LineEdit.text)
	$CenterContainer/AnimationPlayer.play("Show")

func _on_answer_given(answer, time):
	$MarginContainer/Control/AnswerLine/LineEdit.text = answer
	$MarginContainer/Control/AnswerLine/LineEdit2.text = str(time) + "ms"


func _on_CheckBox_toggled(button_pressed):
	Global.UseCustom = button_pressed

func _on_custom_requested(solver, method):
	Confirmation.setup(solver,method)
	Confirmation.show()


func _on_ConfirmationDialog_custom_answer(answer, time):
	pass # Replace with function body.
