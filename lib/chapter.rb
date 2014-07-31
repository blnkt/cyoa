class Chapter
	@@chapters = {}
	def initialize choice, serial
		@chapter_id = Time.new
		@choice = choice
		@serial = serial
		@@chapters[@chapter_id] = [@choice, @serial]
		@associated_chapters = []
	end

  def Class.chapter_by_id(chapter_id)
  	@@chapters.values_at(chapter_id)

	def add_associated_chapter(chapter)
	  @associated_chapters << @chapter_id
	end
end