extends VBoxContainer

export (int) var dayNumber : int
export (Script) var daySolver
export (bool) var bonusSolved : bool

signal answered(answer)

func _ready():
	$DayButton.text = "Day " + str(dayNumber)
	$DayButton.disabled = true if not daySolver else false
	$BonusButton.disabled = true if not bonusSolved else false
	if daySolver:
		daySolver = daySolver.new()


func _on_DayButton_pressed():
	var answer = daySolver.solve_challenge()
	emit_signal("answered", answer)


func _on_BonusButton_pressed():
	emit_signal("answered", daySolver.solve_bonus())
