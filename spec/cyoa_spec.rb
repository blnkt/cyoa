require 'rspec'
require 'chapter'
require 'adventure'

describe 'Chapter' do
  describe ".initialize" do
	  it "intializes chapter with a episode and/or a choice" do
	    new_chapter = Chapter.new({:episode => "it was a dark and stormy night"})
	  	expect(new_chapter).to be_an_instance_of Chapter
		end
	end
    
  # describe '#add_episode' do
		# it "adds an episode to a chapter" do
		# 	new_chapter = Chapter.new(1)
		# 	new_chapter.add_episode("Insanity is repeating the same action and expecting a different result")
		# 	expect(new_chapter.episode).to eq("Insanity is repeating the same action and expecting a different result")
		# end
  # end

  # describe '#add_choice' do
		# it "adds a choice to a chapter" do
		# 	new_chapter = Chapter.new(1)
		# 	new_chapter.add_choice("walk away")
  #     p new_chapter.choices
		# 	expect(new_chapter.choices.length).to eq(1)
		# end
  # end

  describe '.by_id' do
  	it "finds chapters by their adventure ID" do
  		new_chapter = Chapter.new ({:episode => "it was a dark and stormy night"})
  		another_chapter = Chapter.new ({:episode => "convicts on the brain and batman on tv"})
  		next_chapter = Chapter.new ({:episode => "I could take more of the latter and less of the former."})
  		new_chapter.add_id(1)
  		another_chapter.add_id(1)
  		next_chapter.add_id(2)
  		Chapter.by_id(1)
  		expect(Chapter.by_id(1).length).to eq(2)
  	end
  end
end

describe 'Adventure' do
  describe ".initialize" do
	  it "intializes adventure with a chapter and/or an ID" do
	  	stormy_chapter = Chapter.new({:episode => "it was a dark and stormy night"})
	    new_adventure = Adventure.new(:chapter => stormy_chapter, :adventure_id => stormy_chapter.adventure_id)
	  	expect(new_adventure).to be_an_instance_of Adventure
		end
	end
end