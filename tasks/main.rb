require 'csv'
require './task_storage'
require './menu'
require './task'

#=======seeds=========
CSV.open("tasks.csv", "w") do |test| 
	10.times do |i|
		test << Task.new("test #{i}").obj_array
	end
end

task_menu