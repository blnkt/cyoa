class Adventure
  @@adventures = []
  
  attr_reader :adventure_id, :chapter

	def initialize attributes 
    @adventure_id = attributes[:adventure_id]
    @chapter = attributes[:chapter]
    @@adventures << {attributes[:adventure_id] => [attributes[:chapter]]}
  end
end
