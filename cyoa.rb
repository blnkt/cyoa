require './lib/chapter'

prologue = Chapter.new
prologue.add_serial("You awake in a field.  You're clear headed but you remember nothing.  Gaping about, you discover a bicycle, a set of keys, and a baseball hat.")
prologue.add_choice ("Walk the bike out of the field to a nearby road")
prolgue.add_choice("pick up the keys and walk to the road")
prologue.add_choice("Put on the hat and head towards the sound of water")

def main_menu
	current_chapter
	if Chapter.all_chapters.length == 4
		clear screen
		prologue.page
  else
  	clear screen
  	current_chapter.page
	end
	main_menu
end

def clear_screen
  puts "\e[H\e[2J"
end