extends VBoxContainer

export (int) var dayNumber : int
export (Script) var daySolver

signal answered(answer)

func _ready():
	$DayButton.text = "Day " + str(dayNumber)
	if daySolver:
		$DayButton.disabled = false
		daySolver = daySolver.new()
		if daySolver.bonusSolved:
			$BonusButton.disabled = false


func _on_DayButton_pressed():
	var answer = daySolver.solve_challenge()
	emit_signal("answered", answer)


func _on_BonusButton_pressed():
	emit_signal("answered", daySolver.solve_bonus())
