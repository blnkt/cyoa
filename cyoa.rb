require './lib/chapter'

	prologue = Chapter.new({:episode => "You awake in a field.  You're clear headed but you remember nothing.  Gaping about, you discover a bicycle, a set of keys, and a baseball hat."})
	prologue.add_choice ("Walk the bike out of the field to a nearby road")
	prologue.add_choice("pick up the keys and walk to the road")
	prologue.add_choice("Put on the hat and head towards the sound of water")
	prologue.add_episode("You awake in a field.  You're clear headed but you remember nothing.  Gaping about, you discover a bicycle, a set of keys, and a baseball hat.")
  

def main_menu
  page(prologue)
end

def page chapter
	clear_screen
  counter = 0
	chapter.choices.values_at("parent chapter text")[0]
	puts "#{chapter_prompt}\n\n"
  puts "#{current_chapter.episode}\n\n"
  current_chapter.choices.keys.each do |key|
		counter += 1
		puts "#{counter}. #{key}\n"
  end
	puts "*******Enter (#) at any time to leave the adventure*******\n\n"
  if counter > 1
	  puts "\nEnter a number to select a choice\n"
		puts "Enter '+' to add a new choice to this branch of the adventure!!\Enter '<' to go back"
		existing_chapter_menu(current_chapter)
  else
	  puts "\nYour Princess is in another castle.\nEnter '+' to add text and choices to this branch of the adventure!!\nEnter '<' to go back"
	  create_a_chapter_menu(current_chapter)
	end
  page(current_chapter)
end

def existing_chapter_menu chapter
	clear_screen
	current_chapter = chapter
	input = gets.chomp.to_s
	if input == "#"
	  adventure_restart
	elsif input == "<"
		current_chapter = current_chapter.parent_chapter[0]
	elsif input == "+"
	  Puts "\nEnter the text for your new choice:"
	  choice = gets.chomp
	  current_chapter.add_choice(choice)
	elsif input.to_i != 0
		input_key = current_chapter.choices.keys[input.to_i-1]
    current_chapter = current_chapter.choices.fetch(input_key)
	else
		existing_chapter_menu(chapter)
	end
	page(current_chapter)
end

def create_a_chapter_menu chapter
	clear_screen
	current_chapter = chapter
	input = gets.chomp.to_s
	if input == "#"
	  adventure_restart(current_chapter)
	elsif input == "<"
		 current_chapter =  current_chapter.parent_ chapter[0]
	elsif input == "+"
	  puts "\nEnter your new text for this adventure:"
	  episode = gets.chomp
	  current_chapter.add_episode(episode)
	else
		create_a_chapter_menu
	end
	page(current_chapter)
end


def adventure_restart chapter
	clear_screen
	puts "****Enter 'y' to exit the program\nEnter 'n' to start the adventure from the begining****\n"
	exit_maybe = gets.chomp
	if exit_maybe == "y"
		exit
	elsif exit_maybe == "n"
		main_menu
	else
		page(chapter)
	end
end

def clear_screen
  puts "\e[H\e[2J"
end

main_menu