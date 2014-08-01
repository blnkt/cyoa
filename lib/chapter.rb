class Chapter
	@@chapters = {}

	def initialize adventure_id
    @adventure_id = adventure_id
		@chapter_id = Time.new.to_s
		@episode = "it was a dark and stormy night"
		@choices = []
		@previous_chapter = []
		@@chapters[self] = adventure_id
	end

  def Chapter.all_chapters
  	@@chapters
  end

  def Chapter.chapters_by_id adventure_id
  	# @@chapters.each do |key, value|
   #    if key == adventure_id
   #      value
   #    end
   #  end

    @@chapters.keys_at(adventure_id)
  end

  def adventure_id
  	@adventure_id
  end

  def choices
  	@choices
  end

  def episode
  	@episode
  end

  def previous_chapter
  	@previous_chapter
  end

  def add_episode episode
  	@episode = episode
  end

  def add_choice choice
    additional_chapter = Chapter.new(@adventure_id)
    @choices << {choice => additional_chapter}
  end
end

