def init_game
  puts "Welcome to Rock, Paper, Scissors!"
  
  puts "+" * 50
  puts playing(computer_option, human_option)
  puts "+" * 50
  play_again?
end

def computer_option
  result = ["Rock", "paper", "scissors"]
  result[rand(0..2)]
end

def print_options(options)
  puts 'Select an option:'
  options.each { |option| puts option }
end

def human_option
  option = ""
  puts "Choose: ¿Rock, Paper, or Scissors?"
  print_options([
          '1. Rock',
          '2. paper',
          '3. scissors'
        ])
	  i = gets.chomp.to_i
	  case i
	  when 1
      option = "Rock"
	  when 2
      option = "paper"
	  when 3
      option = "scissors"
	  else
		  puts 'SELECCIONE UNA OPCCION CORRECTA'
      init_game
	  end
  option
end

def playing(computer_option, human_option)
  case 
  when human_option == "Rock" && computer_option == "scissors"
    "you win! 🤩"
  when human_option == "scissors" && computer_option == "paper"
    "you win! 🤩"
  when human_option == "paper" && computer_option == "Rock"
    "you win! 🤩"
  when human_option == computer_option
    "You draw! 🥲"
  else
    "you lose! 😔"  
  end
end

def play_again?
  puts "Play again?"

  print_options([
    '1. yes',
    '2. no'
  ])

  i = gets.chomp.to_i
  case i
  when 1
    init_game
  when 2
    return
  else
  puts 'SELECCIONE UNA OPCCION CORRECTA'
  end
end
  

init_game