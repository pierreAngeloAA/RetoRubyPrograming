class TaskStorage

	def self.tasks
		CSV.read("tasks.csv")
	end

	def self.save(task)
		CSV.open("tasks.csv", "a") do |csv|
			csv << task
		end
	end

	def self.update_task(id,	new_title, completed)
		tasks = TaskStorage.tasks

		tasks.each do |item|
			if item[0].to_i == id
				item[1] = new_title
				item[2] = completed
				puts "su tarea fue Actualizada correctamente"
			end
		end

		CSV.open("tasks.csv", "w") do |csv|
			tasks.each { |item| csv << item }
		end
	end

	def self.delete_task(id)
		if TaskStorage.tasks.find{|i| i[0].to_i == id} == nil
			puts "No se encontró el dato en el archivo CSV"
			task_menu
		else
			filtered_tasks = TaskStorage.tasks.reject { |row| row[0].to_i == id }
	
			CSV.open("tasks.csv", "w") do |csv|  
				filtered_tasks.each { |item| csv << item }
			end
		end
	end
end