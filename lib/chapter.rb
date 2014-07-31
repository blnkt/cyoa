class Chapter
	@@chapters = {}

	def initialize
		@chapter_id = Time.new.to_s
		@serial = "it was a dark and stormy night"
		@@chapters[@chapter_id] = @serial
		@choices = []
		@associated_chapters = []
	end

  def Chapter.all_chapters
  	@@chapters
  end

  def Chapter.chapter_by_id chapter_id
  	@@chapters.values_at(chapter_id)
  end

  # def Chapter.choice_by_id chapter
  #   @@chapters.values_at(chapter.chapter_id)[0]
  # end

  # def Chapter.serial_by_id chapter
  # 	@@chapters.values_at(chapter.chapter_id)[1]
  # end

  def chapter_id
  	@chapter_id
  end

  # def associated_chapters
  # 	@associated_chapters
  # end

  def add_serial serial
  	@serial = serial
  end

  def add_choice choice
    @choices << {Chapter.new.chapter_id => choice}
  end
end

