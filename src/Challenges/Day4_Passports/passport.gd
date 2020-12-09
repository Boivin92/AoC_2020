extends Node
class_name Passport

const HEXA : String = "0123456789abcdef"
const VALID_EYE_COLORS : Array = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
const PASSPORT_ID_VALID_CHARACTERS : String = "0123456789" 

var BirthYear 		: String
var IssueYear 		: String
var ExpirationYear 	: String
var Height 			: String
var HairColor 		: String
var EyeColor 		: String
var PassportId 		: String
var CountryId 		: String

const CODE_TO_FULLNAME_MAP := {
			"byr" : "BirthYear", 
			"iyr" : "IssueYear", 
			"eyr" : "ExpirationYear", 
			"hgt" : "Height", 
			"hcl" : "HairColor", 
			"ecl" : "EyeColor", 
			"pid" : "PassportId", 
			"cid" : "CountryId"}

func filter_line(line):
	var inputs = line.split(" ")
	for i in inputs:
		var keyValue = i.split(":")
		if CODE_TO_FULLNAME_MAP.has(keyValue[0]):
			set(CODE_TO_FULLNAME_MAP[keyValue[0]], keyValue[1])

func has_all_values():
	return 	BirthYear and \
			IssueYear and \
			ExpirationYear and \
			Height and  \
			HairColor and \
			EyeColor and \
			PassportId

func is_valid():
	return 	has_all_values() and \
			year_is_valid(BirthYear, 1920, 2002) and \
			year_is_valid(IssueYear, 2010, 2020) and \
			year_is_valid(ExpirationYear, 2020, 2030) and \
			height_is_valid() and \
			hair_is_valid() and \
			eye_is_valid() and \
			id_is_valid()

func year_is_valid(year : String, lowestAllowed : int, highestAllowed : int):
	if year.length() == 4:
		var yearNum = int(year)
		if (yearNum <= highestAllowed) and (yearNum >= lowestAllowed):
			return true
	return false

func height_is_valid():
	var size = int(Height) #Quirk of the language - casting to int simply filters out all letters
	if Height.ends_with("cm"):
		return (size >= 150) and (size <=193)
	if Height.ends_with("in"):
		return (size >= 59) and (size <=76)

func hair_is_valid():
	if HairColor.length() == 7:
		if HairColor[0] == "#":
			for i in range(1,6):
				if HEXA.find(HairColor[i]) == -1:
					return false
			return true
	return false

func eye_is_valid():
	return (VALID_EYE_COLORS.find(EyeColor) != -1)

func id_is_valid():
	if PassportId.length() == 9:
		for letter in PassportId:
			if PASSPORT_ID_VALID_CHARACTERS.find(letter) == -1:
				return false
		return true
	return false
	
