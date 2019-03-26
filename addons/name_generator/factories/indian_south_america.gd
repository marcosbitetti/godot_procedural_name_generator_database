extends Object

var female:Array
var male:Array

var last_generated = ""

func initialize(path):
	#var name = get_script().get_path().get_file().replace('.gd','')
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
	var list = self.get(gender)
	return list[ randi()%list.size() ] 

func _init():
	randomize()
	