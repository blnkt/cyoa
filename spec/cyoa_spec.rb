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

  # describe '.chapters_by_id' do
  # 	it "finds a chapter by its ID" do
  # 		new_chapter = Chapter.new (1)
  #     second_chapter = Chapter.new (1)
  # 		Chapter.chapters_by_id(1)
  # 		expect(Chapter.chapters_by_id(1).length).to eq(2)
  # 	end
  # end
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