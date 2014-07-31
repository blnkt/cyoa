class Chapter
	@@chapters = {}

	def initialize
		@chapter_id = Time.new.to_s
		@episode = "it was a dark and stormy night"
		@choices = []
		@prompt
		@@chapters[@chapter_id] = self
	end

  def Chapter.all_chapters
  	@@chapters
  end

  def Chapter.chapter_by_id chapter_id
  	@@chapters.values_at(chapter_id)
  end

  def Chapter.choices_by_id chapter_id
    @@chapters.values_at(chapter_id).choices
  end

  def Chapter.episode_by_id chapter
  	@@chapters.values_at(chapter.chapter_id).episode
  end

  def chapter_id
  	@chapter_id
  end

  def choices
  	@choices
  end

  def episode
  	@episode
  end

  def prompt
  	@prompt
  end

  def add_episode episode
  	@episode = episode
  end

  def add_choice choice
  	associated_chapter = Chapter.new
    @choices << {associated_chapter => choice}
    associated_chapter.prompt = @choices[-1].value
  end

  def page
		puts "#{current_chapter.prompt}\n\n"
    puts "#{current_chapter.serial}\n\n"
    counter = 0
    current_chapter.choices.each do |choice|
    	counter += 1
    	puts "#{counter}. #{choice.value}\n"
    end
  	puts "Enter the number to select the choice"
  	choice = gets.chomp.to_i
    current_chapter = current_chapter.choices.[choice-1]
  end
end

