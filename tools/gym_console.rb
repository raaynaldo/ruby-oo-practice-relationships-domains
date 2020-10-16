require_relative "../config/environment.rb"
require "rainbow"

def reload
  load "config/environment.rb"
end

def check(correct)
  puts correct ? Rainbow("Passed!").green : Rainbow("Failed!").red
end

silver_spring = Location.new("Silver Spring")
wheaton = Location.new("Wheaton")
rockville = Location.new("Rockville")

a = Trainer.new("a")
b = Trainer.new("b")
c = Trainer.new("c")
d = Trainer.new("d")
e = Trainer.new("e")
f = Trainer.new("f")

LocationTrainer.new(silver_spring, a)
LocationTrainer.new(wheaton, a)
LocationTrainer.new(rockville, a)
LocationTrainer.new(silver_spring, b)
LocationTrainer.new(wheaton, b)
LocationTrainer.new(silver_spring, c)

ray = Client.new("Ray")
fel = Client.new("Fel")
tom = Client.new("tom")
jake = Client.new("jake")
justina = Client.new("Justin A")
justinb = Client.new("Justin B")
justinc = Client.new("Justin C")

ray.assign_trainer(a)
fel.assign_trainer(a)
tom.assign_trainer(b)
jake.assign_trainer(b)
justina.assign_trainer(c)
justinb.assign_trainer(c)
justinc.assign_trainer(c)

binding.pry
0
