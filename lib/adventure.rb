class Adventure
  @@adventures = []
  attr_reader :progress, :name, :branch_id

	def initialize attributes 
    @branches = []
    @progress = []
    @branch_id = 0
    @branches = []
    @@adventures << self
  end

  def add_chapter chapter_id
  	@progress << chapter_id
  end

  # def branch_by_id target_branch_id
  #   @branches.each_index do |branch_id|
  #   @branches.at(target_branch_id) if branch_id == target_branch_id
  # end  

  def add_new_branch?
    if @branches.length == 0
    	@branches << @progress.uniq
    else 
    	@branches.each_index do |branch_id|
	      unless branch_id == @branch_id
	        @branches << (@branches.at(@branch_id) + (@progress.uniq - @branches.at(@branch_id)))
	      end
	    end
	    @branch_id += 1
	  end
  end

  def Adventure.clear_all_adventures
    @@adventures = []
  end

end
