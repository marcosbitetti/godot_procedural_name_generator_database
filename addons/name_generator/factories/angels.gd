extends Object

var first:Array
var middle:Array
var last:Array

var last_generated = ""

func initialize(path):
	#var name = get_script().get_path().get_file().replace('.gd','')
	var f = File.new()
	if f.open(path + '/general.json', File.READ)==OK:
		var data = parse_json(f.get_as_text())
		f.close()
		first = data.first
		middle = data.middle
		last = data.family

func generate(gender=null):
	# first piece
	var name = first[ randi() % first.size() ]
	# middle of name
	if (randi()%3)>0:
		name += middle[ randi() % middle.size() ]
	# one more step ?
	if (randi()%6)>4:
		name += middle[ randi() % middle.size() ]
	
	if (randi()%10)>4:
		name += last[ 1 + randi() % (last.size()-1) ]
	else:
		name += last[0]
	
	if name == last_generated:
		name = generate(gender)
	last_generated = name
	return name

func _init():
	randomize()
	