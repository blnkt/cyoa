class Chapter
	@@chapters = []

  attr_reader :episode, :choices, :parent_chapter

	def initialize attributes
		@episode = "This choice needs your adventure!"
		@choices = {}
    @parent_chapter = []
    @@chapters << self
	end

  def Chapter.all_chapters
  	@@chapters
  end

  def add_episode episode
    @episode = episode.to_s
  end

  def add_choice choice
    choice_chapter = Chapter.new({:episode => "Zippy!!"})
    choice_chapter.parent_chapter << self
    choice_chapter.choices["parent chapter text"] = choice.to_s #b/c the first choice is always going back
    @choices[choice.to_s] = choice_chapter
  end
end

