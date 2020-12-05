extends VBoxContainer

export (int) var dayNumber : int
export (Script) var daySolver

signal answered(answer)

func _ready():
	$DayButton.text = "Day " + str(dayNumber)
	if daySolver:
		$DayButton.disabled = false
		var solver : Solver = daySolver.new()
		solver.inputFileName = "Day" + str(dayNumber) + ".txt"
		solver.name = "daySolver"
		add_child(solver)
		if $daySolver.bonusSolved:
			$BonusButton.disabled = false


func _on_DayButton_pressed():
	if $daySolver:
		emit_signal("answered", $daySolver.get_answer())


func _on_BonusButton_pressed():
	if $daySolver:
		emit_signal("answered", $daySolver.get_bonus_answer())
