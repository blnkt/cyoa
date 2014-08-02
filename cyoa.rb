# require './lib/chapter'

prologue = Chapter.new({:episode => "You awake in a field.  You're clear headed but you remember nothing.  Gaping about, you discover a bicycle, a set of keys, and a baseball hat."})
prologue.add_choice ("Walk the bike out of the field to a nearby road")
prolgue.add_choice("pick up the keys and walk to the road")
prologue.add_choice("Put on the hat and head towards the sound of water")

current_chapter = prologe

def main_menu
	if Chapter.all_chapters.length < 4
		page(prologue)
  else
  	page(current_chapter)
	end
	main_menu
end

def page chapter
	clear_screen
	chapter_prompt = chapter.choices.values_at("parent_chapter")
	puts "*******Enter (#) at any time to leave the adventure*******\n\n"
	puts "#{chapter_prompt}\n\n"
  puts "#{chapter.episode}\n\n"
  if chapter.episode "This choice needs your adventure!"
  choices_menu
  page_menu
end

def page_menu
	puts "Enter the number to select the choice\n\nEnter '<' to undo your choice\n"
	input = gets.chomp
	if input == "#"
	  adventure_restart
	elsif input == "<"
		current_chapter.previous_chapter.page
	else
	  current_chapter = current_chapter.choices.[choice-1]
	end
end

def choices_menu
	counter = 0
	current_chapter.choices.each do |choice|
		counter += 1
		puts "#{counter}. #{choice.value}\n"
	end
end

def clear_screen
  puts "\e[H\e[2J"
end

def adventure_restart
	clear_screen
	Puts "****Enter (y) to exit the program\nEnter (n) to start over****\n"
	input = gets.chomp
	if input == "y"
		exit
	elsif input == "n"
		main_menu
	else
		current_chapter.page
	end
end