require 'rspec'
require 'chapter'
require 'adventure'

describe 'Chapter' do
  before do
  	Chapter.clear_all_chapters
  end

  describe "#initialize" do
	  it "intializes chapter with a episode and/or a choice" do
	    new_chapter = Chapter.new({:name => "friendship"})
	  	expect(new_chapter).to be_an_instance_of Chapter
      expect(new_chapter.name).to eq("friendship")
		end
	end
    
  describe '#add_episode' do
    it "adds an episode text to a chapter" do
    	unexpected_astronaut = Chapter.new({:name => "blnkt"})
    	unexpected_astronaut.add_episode("No one ever expects the unexpected astronaut!!", "blnkt")
    	expect(unexpected_astronaut.episode).to eq("No one ever expects the unexpected astronaut!!")
      expect(unexpected_astronaut.name).to eq("blnkt")
    end

    it "adds an episode text to a chapter" do
      highlander = Chapter.new({:name => "MacLeod"})
      highlander.add_episode("There can only be one!", "Ramirez")
      expect(highlander.episode).to eq("There can only be one!")
      expect(highlander.name).to eq("MacLeod & Ramirez")
    end
  end

  describe '#add_choice' do
    it "adds a choice to a chapter" do
      beatles_chapter = Chapter.new({:episode => "they came in through the bathroom window", :id => 2})
      beatles_chapter.add_choice("walk away", "blnkt")
      beatles_chapter.add_choice("fight!", "wyatt")
      expect(beatles_chapter.choices.length).to eq(2)
      expect(beatles_chapter.choices[1]).to eq(2)
    end
  end
end

describe 'Adventure' do
  before do
    Adventure.clear_all_adventures
  end

  describe "#initialize" do
    it "initializes an Adventure (i.e. an adventurer's reading/writing of the available chapters" do
      new_adventure = Adventure.new({:name => "blnkt"})
      another_adventure = Adventure.new({:name => "blnkt"})
      expect(new_adventure).to be_an_instance_of(Adventure)
      expect(Adventure.all_adventures.length).to eq(2)
    end
  end

  # describe ".branch_by_id" do
  #   it "searches through the branches for a branch (a set of chapters)" do
  #     three_adventure = Adventure.new({:branch_id => 3})
  #     three_adventure.branch_by_id(3).length.to eq(1)
  #   end
  # end

  describe "#add_chapter" do
    it "adds a chapter to an adventurer's progress" do
      four_adventure = Adventure.new({:name => "Bill"})
      four_adventure.add_chapter(1)
      four_adventure.add_chapter(2)
      four_adventure.add_chapter(3)
      expect(four_adventure.progress).to eq([1, 2, 3])
    end

    it "adds a chapter to an adventurer's progress" do
      six_adventure = Adventure.new({:name => "William"})
      six_adventure.add_chapter(1)
      six_adventure.add_chapter(2)
      six_adventure.add_chapter(3)
      six_adventure.add_chapter(2)
      expect(six_adventure.progress).to eq([1, 2, 3])
    end
  end

  # describe "#add_new_branch?" do
  #   it "appends Adventurer's progress since last divergence/backtrack to branches" do
  #     five_adventure = Adventure.new({:name => "Samatowic"})
  #     five_adventure.add_chapter(5)
  #     five_adventure.add_chapter(7)
  #     expect(five_adventure.branches.length).to eq(1)
  #   end

  #   # it "appends Adventurer's progress since last divergence/backtrack to branches" do
  #   #   six_adventure = Adventure.new({:name => "William"})
  #   #   six_adventure.add_chapter(1)
  #   #   six_adventure.add_chapter(2)
  #   #   six_adventure.add_chapter(3)
  #   #   six_adventure.add_new_branch?
  #   #   p six_adventure.branch_id
  #   #   p six_adventure.progress
  #   #   p six_adventure.branches
  #   #   # p six_adventure.branch_id
  #   #   six_adventure.add_chapter(4)
  #   #   p six_adventure.progress
  #   #   six_adventure.add_new_branch?
  #   #   p six_adventure.branches
  #   #   p six_adventure.branch_id
  #   #   expect(six_adventure.branches.length).to eq(2)
  #   # end
  # end
end
