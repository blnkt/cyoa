class Adventure
  @@adventures = []
  attr_reader :progress, :name, :branches #:branch_id

	def initialize attributes 
		@name = attributes[:name]
    @branches = []
    @progress = []
    # @branch_id = 0
    @branches = []
    @@adventures << self
  end

  def Adventure.all_adventures
  	@@adventures
  end

  def add_chapter chapter_id
  	if @progress.include?(chapter_id)
  		@branches << @progress unless @branches.include?(@progress)
  	else
  		@progress << chapter_id
    end
  end

  # def branch_by_id target_branch_id
  #   @branches.each_index do |branch_id|
  #   @branches.at(target_branch_id) if branch_id == target_branch_id
  # end  

  # def add_new_branch?
  #   if @branches.length == 0
  #   	@branches << @progress.uniq
  #   	@branch_id += 1
  #   else 
  #   	p "hey"
  #   	new_progress = @progress.uniq #- @branches.at(@branch_id)
  #     # new_branch = @branches.at(@branch_id) + new_progress
  #     @branches << new_progress
  #     @branch_id += 1
	 #  end
  # end

  def Adventure.clear_all_adventures
    @@adventures = []
  end
end
