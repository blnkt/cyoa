class Chapter
	@@chapters = []

  attr_reader :episode, :choices

	def initialize attributes
    # @adventure_id = attributes[:adventure_id]
		@episode = "This choice needs your adventure!"
		@choices = {}
    # @parent_chapter = []
    @@chapters << self
	end

  def Chapter.all_chapters
  	@@chapters
  end

  def add_episode episode
    @episode = episode.to_s
  end

  # def add_id new_adventure_id
  #   @adventure_id = new_adventure_id
  # end
  
  # def add_parent_chapter parent_choice, parent_chapter
  #   @parent_chapter[parent_chapter] = parent_choice.to_s
  # end

  # def Chapter.by_id target_adventure_id
  #   target_chapters = []
  #   @@chapters.each do |chapter|
  #     target_chapters << chapter if chapter.adventure_id == target_adventure_id
  #   end
  #   target_chapters
  # end

  def add_choice choice
    choice_chapter = Chapter.new({:episode => "Zippy!!",})
    choice_chapter.choices["parent_chapter"] = choice.to_s #b/c the first choice is always going back
    @choices[choice.to_s] = choice_chapter
  end
end

