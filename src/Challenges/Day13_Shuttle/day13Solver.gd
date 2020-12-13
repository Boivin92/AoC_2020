extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "207"
#	bonusAnswer = ""

func _solve_challenge() -> String:
	var earliest = float(inputData[0])
	var in_service = inputData[1].split(",")
	var current_wait_time = 1000000 #Just to be sure this is high enough
	var bus_id
	for bus in in_service:
		if bus == "x":
			continue
		else:
			var bus_number = float(bus)
			var wait_time = ((int(earliest / bus_number) + 1) * bus_number) - earliest
			if wait_time < current_wait_time:
				current_wait_time = wait_time
				bus_id = bus_number
	return str(bus_id * current_wait_time)

func _solve_bonus() -> String:
	var bus_schedule = get_bus_schedule()
	var timestamp = 0
	var lowest_common_denum = 1
	for bus_id in bus_schedule:
		while((timestamp + bus_schedule[bus_id]) % bus_id) != 0:
			timestamp += lowest_common_denum
		lowest_common_denum *= bus_id
	return str(timestamp)

func get_bus_schedule():
	var schedule := {}
	var buses = inputData[1].split(",")
	for i in buses.size():
		if buses[i] == "x":
			continue
		else:
			schedule[int(buses[i])] = i
	return schedule
