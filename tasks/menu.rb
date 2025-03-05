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
			create
			puts '=' * 40
	  when 2
			puts '=' * 40
			task_list
			puts '=' * 40
	  when 3
			puts '=' * 40
			update_task
			puts '=' * 40
	  when 4
			puts '=' * 40
			delete_task
			puts '=' * 40
	  when 5
			task_menu
	  else
			puts 'SELECCIONE UNA OPCCION CORRECTA'
			task_menu
	  end
  end
end

def create
	puts "Escriba el titulo de la tarea"
	Task.new(gets.chomp).save
	puts "Su tarea fue creada exitosamente"
end

def	task_list
	puts "Lista de Tareas"
	TaskStorage.tasks.each do |row|
		puts "Id: #{row[0]} Titulo: #{row[1]} Completada: #{row[2]}"
	end
end

def	delete_task
	puts "Digite el Id de la tarea que quiere eliminar"
	TaskStorage.delete_task(gets.chomp.to_i)
	puts "Su tarea fue eliminada exitosamente"
	task_menu
end

def update_task
	puts "Digite el Id de la tarea que quiere actualizar"
	id = gets.chomp.to_i

	if TaskStorage.tasks.find {|item| item[0].to_i == id} == nil
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
		puts completed
		puts "opccion invalida"
	end

	TaskStorage.update_task(id, new_title, completed)
	puts "Tarea: #{new_title} terminada: #{completed}"
end

def print_options(options)
    puts 'Seleccione una opcion:'
    options.each { |option| puts option }
end