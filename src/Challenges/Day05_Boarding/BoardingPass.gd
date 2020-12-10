extends Node
class_name BoardingPass

var code : String

func validate_code():
	for i in range(0,7):
		if not ((code[i] == "B") or (code[i] == "F")):
			return false
	for j in range (8,10):
		if not ((code[j] == "L") or (code[j] == "R")):
			return false
	return true

func find_row():
	var row = 0
	for i in range(0,7):
		if code[i] == "B":
			row += pow(2, 6-i)
	return row

func find_seat():
	var seat = 0
	for i in range(7,10):
		if code[i] == "R":
			seat += pow(2, 9-i)
	return seat
	
func get_seat_id():
	return (find_row() * 8) + find_seat()
