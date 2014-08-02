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

			expect(beatles_chapter.choices.keys).to eq(["walk away"])
			expect(choice_chapter.choices.keys).to eq(["parent_chapter"])

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

# describe 'Adventure' do
#   describe ".initialize" do
# 	  it "intializes adventure with a chapter and/or an ID" do
# 	  	stormy_chapter = Chapter.new({:episode => "it was a dark and stormy night"})
# 	    new_adventure = Adventure.new(:chapter => stormy_chapter, :adventure_id => stormy_chapter.adventure_id)
# 	  	expect(new_adventure).to be_an_instance_of Adventure
# 		end
# 	end
# end