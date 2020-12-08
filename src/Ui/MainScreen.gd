extends Panel

onready var Confirmation = $ConfirmationDialog
onready var AnswerLine = $Margin/Content/AnswerLine/AnswerText
onready var TimeLine = $Margin/Content/AnswerLine/TimeText
onready var Grid = $Margin/Content/CalendarGrid
onready var ToastAnimation = $CenterContainer/ToastAnimationPlayer

func _ready():
	for child in Grid.get_children():
		if child is VBoxContainer:
			child.connect("answered", self, "_on_answer_given")
			child.connect("custom_requested", self, "_on_custom_requested")

func _on_ClipboardButton_pressed():
	OS.set_clipboard(AnswerLine.text)
	ToastAnimation.play("Show")

func _on_answer_given(answer, time):
	AnswerLine.text = answer
	TimeLine.text = str(time) + "ms"


func _on_CheckBox_toggled(button_pressed):
	Global.UseCustom = button_pressed

func _on_custom_requested(solver, method):
	Confirmation.setup(solver,method)
	Confirmation.show()
