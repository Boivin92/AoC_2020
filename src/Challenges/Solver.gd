extends Node
class_name Solver

const ERROR_FORMAT = "ERROR: Answer %s differs from known answer %s"

var inputFileName : String
var bonusSolved : bool = false

var dayAnswer : String
var bonusAnswer : String

func load_data():
	var file = File.new()
	file.open("res://Challenges/Inputs/" + inputFileName, File.READ)
	var content = file.get_as_text()
	file.close()
	return content.split("\n")


func get_answer():
	var answer = _solve_challenge()
	if dayAnswer:
		if dayAnswer != answer:
			return ERROR_FORMAT % [answer, dayAnswer]
	return answer

func get_bonus_answer():
	var answer = _solve_bonus()
	if bonusAnswer:
		if bonusAnswer != answer:
			return ERROR_FORMAT % [answer, bonusAnswer]
	return answer


func _solve_challenge() -> String:
	return ""

func _solve_bonus() -> String:
	return ""
