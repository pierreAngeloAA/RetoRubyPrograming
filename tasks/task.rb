class Task
	attr_accessor :title, :completed, :id

	@@counter = 0
	@@tasks = TaskStorage.tasks

	def initialize(title)
		@@counter += 1
		@title = title
		@completed = false
		@id = @@counter 
	end

	def save
		TaskStorage.save(self.obj_array)
	end

	def delete
		TaskStorage.delete_task(self)
	end

	def self.find(id)
		(TaskStorage.tasks.find{|r| r[0] == id}).delete
	end
	
	def obj_array
		[@id, @title, @completed]
	end
end