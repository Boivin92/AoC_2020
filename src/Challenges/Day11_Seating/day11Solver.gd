extends Solver

func _ready():
	bonusSolved = false
	dayAnswer = "2448"
#	bonusAnswer = ""

func _solve_challenge() -> String:
	var states := []
	states.append(state(Array(inputData)))
	states.append(state(states[0].calculate_next()))
	while(states[states.size()-1].CurrentLayout != states[states.size()-2].CurrentLayout):
		states.append(state(states.back().calculate_next()))
	return str(states.back().count_occupied_seats())

func state(array):
	var new_state = SeatLayout.new()
	new_state.load_layout(array)
	return new_state

func _solve_bonus() -> String:
	return ""
