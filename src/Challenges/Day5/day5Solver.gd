extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "858"
	bonusAnswer = "557"

func _solve_challenge() -> String:
	var boardingPasses = calculate_and_sort_seats()
	return str(boardingPasses.back())

func _solve_bonus() -> String:
	var boardingPasses = calculate_and_sort_seats()
	for i in boardingPasses.size():
		if (boardingPasses[i] < 8) or (boardingPasses[i] > 1016) or i == boardingPasses.size()-1:
			continue
		if boardingPasses[i+1] == boardingPasses[i]+2:
			return str(boardingPasses[i]+1)
	return "SEAT NOT FOUND"

func calculate_and_sort_seats():
	var boardingPasses = []
	for line in inputData:
		var bp = BoardingPass.new()
		bp.code = line
		var sid = bp.get_seat_id()
		boardingPasses.append(sid)
	boardingPasses.sort()
	return boardingPasses
