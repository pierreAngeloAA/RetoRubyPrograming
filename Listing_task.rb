require 'csv'

class Task
	attr_accessor :title, :completed, :id

	@@counter = 0

	def initialize(title)
		@@counter += 1
		@title = title
		@completed = false
		@id = @@counter
	end

	def self.list_task
		CSV.foreach("test.csv") do |row|
			puts "Id: #{row[0]} Titulo: #{row[1]} Completada: #{row[2]}"
		end
	end

	def self.create_task
		puts "Escriba el titulo de la tarea"
		title = gets.chomp
		task = Task.new(title).array_data
		CSV.open("test.csv", "a") do |csv|
			csv << task
		end
		puts "Su tarea fue creada exitosamente"
	end

	def self.update_task(id)
		data = CSV.read("test.csv")
		puts "#{id}"

		if data.find {|item| item[0].to_i == id} == nil
			puts "No se encontró el dato en el archivo CSV"
			task_menu
		end

		puts "Digite el nuevo titulo de la tarea"
		new_title  = gets.chomp

		puts "Digite si fue completada la tarea"
		
		print_options([
			'1. tarea completada',
			'2. tarea no completada',
		])

		completed  = gets.chomp.to_i
		case completed
		when 1
			completed = true
		when 2
			completed = false
		else
			puts "opccion invalida"
		end

		data.each do |item|
			if item[0].to_i == id
				item[1] = new_title
				item[2] = completed
			end
		end

		CSV.open("test.csv", "w") do |csv|
			data.each { |item| csv << item }
		end
		puts "su tarea fue Actualizada correctamente"
		puts "Tarea: #{new_title} terminada: #{completed}"
	end

	def self.delete_task(id)
		data = CSV.read("test.csv")
		
	 	if data.find { |item| item[0].to_i == id } == nil
			puts "No se encontró el dato en el archivo CSV"
			task_menu
		end

		data = data.select {|item| item[0].to_i != id }

		CSV.open("test.csv", "w") do |csv|
			data.each { |item| csv << item }
		end
		puts "su tarea fue eliminada exitosamente"
		task_menu
	end

	def array_data
		[@id, @title, @completed]
	end
end

# Menu ================Menu================== Menu

def task_menu
	i = 0
	while i != 4
	  print_options([
					  '1. create task',
					  '2. list Tasks',
					  '3. Update Task',
					  '4. Delete Task'
					])
	  i = gets.chomp.to_i
	  case i
	  when 1
			  puts '=' * 40
			Task.create_task
			puts '=' * 40
	  when 2
			puts '=' * 40
			puts "Lista de Tareas"
			Task.list_task
			puts '=' * 40
	  when 3
			puts '=' * 40
			puts "Digite el Id de la tarea que quiere actualizar"
			id = gets.chomp.to_i
			Task.update_task(id)
			puts '=' * 40
	  when 4
			puts '=' * 40
			puts "Digite el Id de la tarea que quiere eliminar"
			id  = gets.chomp.to_i
			Task.delete_task(id)
			puts '=' * 40
	  when 5
			task_menu
	  else
			puts 'SELECCIONE UNA OPCCION CORRECTA'
	  end
  end
end

def print_options(options)
  puts 'Seleccione una opcion:'
  options.each { |option| puts option }
end

CSV.open("test.csv", "w") do |test| 
	10.times do |i|
		test << Task.new("test #{i}").array_data
	end
end


puts Task.new("es el").id
task_menu