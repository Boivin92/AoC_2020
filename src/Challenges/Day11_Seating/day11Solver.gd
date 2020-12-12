extends Solver

const WITH_LINE_OF_SIGHT = true
const PROXIMITY = false

func _ready():
	bonusSolved = true
	dayAnswer = "2448"
	bonusAnswer = "2234"


func _solve_challenge() -> String:
	return process_puzzle(PROXIMITY)

func _solve_bonus() -> String:
	return process_puzzle(WITH_LINE_OF_SIGHT)


func state(array):
	var new_state = SeatLayout.new()
	new_state.load_layout(array)
	return new_state


func process_puzzle(lineOfSight):
	var states := []
	states.append(state(Array(inputData)))
	states.append(state(states[0].calculate_next(lineOfSight)))
	while(states[states.size()-1].CurrentLayout != states[states.size()-2].CurrentLayout):
		states.append(state(states.back().calculate_next(lineOfSight)))
	return str(states.back().count_occupied_seats())
