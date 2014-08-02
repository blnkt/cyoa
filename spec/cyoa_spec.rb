require 'rspec'
require 'chapter'

describe 'Chapter' do
  describe ".initialize" do
	  it "intializes chapter with a episode and/or a choice" do
	    new_chapter = Chapter.new({:episode => "it was a dark and stormy night"})
	  	expect(new_chapter).to be_an_instance_of Chapter
		end
	end
    
  describe '#add_choice' do
		it "adds target chapter as a choice for chapter" do
			dummy_chapter = Chapter.new ({:episode => "I'm nobody's fool"})
			beatles_chapter = Chapter.new({:episode => "they came in through the bathroom window"})
			beatles_chapter.add_choice("walk away")
			choice_chapter = beatles_chapter.choices.values_at("walk away")[0]
      
      expect(choice_chapter.parent_chapter).to eq([beatles_chapter])
			expect(beatles_chapter.choices.keys).to eq(["walk away"])
			expect(choice_chapter.choices.keys).to eq(["parent chapter text"])

		end
  end

  describe '#add_episode' do
    it "adds an episode text to a chapter" do
    	unexpected_astronaut = Chapter.new({:episode => "This choice is not your adventure."})
    	unexpected_astronaut.add_episode("No one ever expects the unexpected astronaut!!")
    	expect(unexpected_astronaut.episode).to eq("No one ever expects the unexpected astronaut!!")
    end
  end
end