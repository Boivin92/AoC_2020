extends Node
class_name Solver

const ERROR_FORMAT = "ERROR: Answer %s differs from known answer %s"

var inputFileName : String
var bonusSolved : bool = false

var dayAnswer : String
var bonusAnswer : String

var elapsedTime : int = 0
var startTime : int
var endTime : int

var inputData

func load_data():
	var file = File.new()
	file.open("res://Challenges/Inputs/" + inputFileName, File.READ)
	var content = file.get_as_text()
	file.close()
	return content.split("\n")


func get_answer(custom_inputs = null):
	pre_solve(custom_inputs)
	var answer = _solve_challenge()
	return post_solve(dayAnswer, answer)

func get_bonus_answer(custom_inputs = null):
	pre_solve(custom_inputs)
	var answer = _solve_bonus()
	return post_solve(bonusAnswer, answer)

func pre_solve(custom_inputs = null):
	if custom_inputs:
		inputData = custom_inputs.split("\n")
	else:
		inputData = load_data()
	startTime = OS.get_ticks_msec()

func post_solve(expected, actual):
	endTime = OS.get_ticks_msec()
	elapsedTime = endTime - startTime
	if expected:
		if expected != actual:
			return ERROR_FORMAT % [actual, expected]
	return actual

func _solve_challenge() -> String:
	return ""

func _solve_bonus() -> String:
	return ""
