require './lib/chapter'

@prologue = Chapter.new({:episode => "You awake in a field.  You're clear headed but you remember nothing.  Gaping about, you discover a bicycle, a set of keys, and a baseball hat."})
@prologue.add_choice ("Walk the bike out of the field to a nearby road")
@prologue.add_choice("pick up the keys and walk to the road")
@prologue.add_choice("Put on the hat and head towards the sound of water")
@current_chapter = @prologue

def main_menu
  if @current_chapter = @prologue
    page(@prologue)
  else
  	page(@current_chapter)
  end
	main_menu
end

def page chapter
	clear_screen
	chapter_prompt = chapter.choices.values_at("parent chapter text")[0]
	puts "*******Enter (#) at any time to leave the adventure*******\n\n"
	puts "#{chapter_prompt}\n\n"
  puts "#{chapter.episode}\n\n"
  unless chapter.episode == "This choice needs your adventure!"
    counter = 0
	  chapter.choices.keys.shift.each do |key|
			counter += 1
			puts "#{counter}. #{key}\n"
	  end
		puts "\nEnter a number to select a choice\n"
		puts "Press '+' to add a new choice to this branch of the adventure!!\nPress '<' to go back"
		existing_chapter_menu
  else
	  puts "\nYour Princess is in another castle.\nPress '+' to add text and choices to this branch of the adventure!!\nPress '<' to go back"
	  create_a_chapter_menu
	end
  page_menu
end

def existing_chapter_menu
	input = gets.chomp.to_s
	if input == "#"
	  adventure_restart
	elsif input == "<"
		@current_chapter = @current_chapter.parent_chapter[0]
	elsif input == "+"
	  Puts "\nEnter the text for your new choice:"
	  choice = gets.chomp
	  @current_chapter.add_choice(choice)
	elsif input.to_i != 0
		input_key = @current_chapter.choices.keys[input.to_i-1]
    @current_chapter = @current_chapter.choices.fetch(input_key)
	else
		existing_chapter_menu
	end
	page(@current_chapter)
end

def create_a_chapter_menu
	input = gets.chomp.to_s
	if input == "#"
	  adventure_restart
	elsif input == "<"
		@current_chapter = @current_chapter.parent_chapter[0]
	elsif input == "+"
	  puts "\nEnter your new text for this adventure:"
	  episode = gets.chomp
	  @current_chapter.add_episode(episode)
	else
		create_a_chapter_menu
	end
	page(@current_chapter)
end


def adventure_restart
	clear_screen
	puts "****Enter 'y' to exit the program\nEnter 'n' to start the adventure from the begining****\n"
	exit_maybe = gets.chomp
	if exit_maybe == "y"
		exit
	elsif exit_maybe == "n"
		@current_chapter = @prologue
		main_menu
	else
		page(@current_chapter)
	end
end

def clear_screen
  puts "\e[H\e[2J"
end

main_menu