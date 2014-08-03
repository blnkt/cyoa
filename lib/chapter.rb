class Chapter
	@@chapters = []

  attr_reader :episode, :choices, :parent_chapter, :id, :name, :prompt

	def initialize attributes
    @name = attributes[:name]
    @prompt = attributes[:prompt]
    @parent_chapter = attributes[:parent_chapter]
    @id = attributes[:id]
		@episode = "This choice needs your adventure!"
		@choices = []
    @@chapters << self
	end

  def Chapter.all_chapters
  	@@chapters
  end

  def Chapter.by_id target_id
    @@chapters.each_index do |chapter_index|
      @@chapters.at(target_id) if chapter_index == target_id
    end    
  end

  def Chapter.clear_all_chapters
    @@chapters = []
  end

  def add_episode episode, author
    @episode = episode.to_s
    unless @name.to_s == author.to_s
      @name = @name.to_s + " & " + author.to_s
    end
  end

  def add_choice choice, author
    if @@chapters.length == 1
      @id = 0
      Chapter.new({:prompt => choice, :parent_chapter => @id, :id => (@id + 1), :name => author})
      @id += 1
      @choices << @id
    else
      next_id = @@chapters.length
      Chapter.new({:prompt => choice, :parent_chapter => @id, :id => next_id, :name => author})
      @choices << next_id
    end
  end
end

