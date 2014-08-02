class Chapter
	@@chapters = {}

  attr_reader :episode, :choices, :last_choice, :adventure_id

	def initialize attributes
    @adventure_id = Time.new.to_s
		@episode = attributes[:episode]
		@choices = []
		@last_choice = attributes[:last_choice]
    @choices << @last_choice
    @@chapters[@episode] = @choices
	end

  def Chapter.all_chapters
  	@@chapters
  end

  # def Chapter.chapters_by_id adventure_id
  # 	# @@chapters.each do |key, value|
  #  #    if key == adventure_id
  #  #      value
  #  #    end
  #  #  end

  #   @@chapters.keys_at(adventure_id)
  # end

  # def add_choice choice
  #   additional_chapter = Chapter.new(@adventure_id)
  #   @choices << {choice => additional_chapter}
  # end
end

