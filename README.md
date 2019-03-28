# Godot Procedural Name Generator Database
This repo is only the data files from [Godot Procedural Name Generator Plugin](https://github.com/marcosbitetti/godot_procedural_name_generator).

### How Contribute?

Any one can contribute, from this repo, or send email to author with names data. But, we show how make it on GitHub (best way).

If your not has programming skills, just create JSON files.
This files can use defaults fields: "first", "family"
The default factory, get these lists in "general.json" and generate a name.
This is the most simple use.

You can separate it in files, to create genders, where "general.json" store family names, "male.json" to males and "female.json" to ladies.

Put all inside a folder in ./database

If you create a rule file, put it on ./factories, this is a GDScript that the same name of database folder.

**A full example of folder:**

      ./addons
              /name_generator
                             /database
                                      /my_creatures
                                                   /general.json
                                                   /female.json
                                                   /male.json
                             /factories
                                       /my_creatures.dg

Then create a fork from this repo ([tutorial](https://help.github.com/en/articles/fork-a-repo))

Add your files:

      git add .
      git commit -am 'Added My Creatures specie'
      git push

And create a pull request ([tutorial](https://help.github.com/en/articles/creating-a-pull-request-from-a-fork))


### Example of configuration files

##### A simple file
      # general.json
      {
        "first":["Adrian","Alan","Baldur","Rat"],
        "family":["the Empaler","the Cursed","the Plagged"]
      }

##### A gender generation
      # general.json can store family names or designation
      {
        "family":["the Empaler","the Cursed","the Plagged"]
      }

      # male.json
      {
        "first":["Adrian","Alan","Baldur","Rat"]
      }

      # female.json
      {
        "first":["Ariel","Aline","Jasmine","Zelda"]
      }

##### A Factory file
This is a GDScript class file. That rulled the generation.
If you not provide one, the engine uses a default Generator.

      class Generator:
        var first = Array()
        var family = Array()

        func initialize(store_path): # this receives the path of directory that contains .json
          var f = File.new()
          if f.open(path + '/general.json')==OK:
            var data = parse_json(f.get_as_text())
            f.close()
            first = data.first
            family = data.family

        func generate(gender=null): # this receives gender if applicable, use default NULL
          var name = first[ randi()%first.size() ]
          name += " " + family[ randi()%family.size() ]

          return name.capitalize()

        func _init():
          pass

### Reference works

* [lua-namegen](https://github.com/LukeMS/lua-namegen)
* [namegen](https://github.com/ironarachne/namegen)
* [RandomNameGenerator](https://github.com/jtuttle87/RandomNameGenerator/blob/master/RandomNameGenerator/NameGenerator.cs)
