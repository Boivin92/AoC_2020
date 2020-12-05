extends ConfirmationDialog

var solver
var method

signal custom_answer(answer, time)

func setup(newSolver, newMethod):
	if newSolver != solver:
		$TextEdit.text = ""
		solver = newSolver

func _on_ConfirmationDialog_confirmed():
	emit_signal("custom_answer", solver.call(method, $TextEdit.text), solver.elapsedTime)
