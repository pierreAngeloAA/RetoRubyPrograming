# require 'csv'

# data = File.open("test.csv"){|file|CSV.read(file)}

# puts "#{data.inspect}"

class Task
	attr_accessor :title, :completed

	@@list_task = []

	def initialize(title)
		@title = title
		@completed = false
	end

	def self.find_task(title)
		@@list_task.find{ |element| element.title == title }
 	end

	def self.list_task
		@@list_task
	end

	def self.create_task
		puts "Escriba el titulo de la tarea"
		title = gets.chomp
		Task.list_task << Task.new(title)
		puts "Su tarea fue creada exitosamente"
	end

	def self.read_task
		Task.list_task.each do |task|
			puts "titulo: #{task.title} resuelta: #{task.completed}"
		end
	end

	def self.update_task(title)
		task = Task.find_task(title)
		if task == nil
			puts "Su tarea no fue encontrada"
			task_menu
		end

		puts "Digite el nuevo titulo de la tarea"
		new_title  = gets.chomp
		task.title = new_title
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
		task.completed = completed
		puts "su tarea fue Actualizada correctamente"
		puts "Tarea: #{task.title} terminada: #{task.completed}"
	end

	def self.delete_task(title)
		task = Task.find_task(title)
		if task == nil
			puts "Su tarea no fue encontrada"
			task_menu
		end
		@@list_task = Task.list_task.select { |task| task.title != title}
		puts "su tarea fue eliminada exitosamente"
		task_menu
	end
end

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
			Task.read_task
			puts '=' * 40
	  when 3
			puts '=' * 40
			puts "Digite el titulo de la tarea que quiere actualizar"
			title  = gets.chomp
			Task.update_task(title)
			puts '=' * 40
	  when 4
			puts '=' * 40
			puts "Digite el titulo de la tarea que quiere eliminar"
			title  = gets.chomp
			Task.delete_task(title)
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

(0..10).each { |i| Task.list_task << Task.new("test #{i}")}


task_menu