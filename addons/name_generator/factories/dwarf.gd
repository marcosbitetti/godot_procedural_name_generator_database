extends Object

var female:Dictionary
var male:Dictionary

var last_generated = ""

func initialize(path):
	var f = File.new()
	if f.open(path + '/female.json', File.READ)==OK:
		var data = parse_json(f.get_as_text())
		f.close()
		female = data
	if f.open(path + '/male.json', File.READ)==OK:
		var data = parse_json(f.get_as_text())
		f.close()
		male = data
	generate()

func generate(gender=null):
	if not gender:
		gender = 'male'
		if (randi()%2)==0:
			gender = 'female'
	var data = self.get(gender)
	
	var name = data.first[ randi()%data.first.size() ]
	if (randi()%10)>8:
		name += data.first[ randi()%data.first.size() ]
	name += data.last[ randi()%data.last.size() ]
	
	name = name.capitalize()
	
	# from https://www.paolini.net/fans/invented-languages-inheritance-cycle/dwarf-language/dwarf-language-english-dictionary/
	if (randi()%10)>8:
		match randi()%5:
			0:
				name += " rak und " # warior of
			1:
				name += " rak menthiv " # son of
			2:
				name += " az " # the
			3:
				name += " rak sagh " # friend of
			4:
				name += " rak " # of
	
	name += " " + data.legend[ randi()%data.legend.size() ].capitalize()
	
	if last_generated==name:
		name = generate(gender)
	last_generated = name
	return name

func _init():
	randomize()
	