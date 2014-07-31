require 'cyoa_spec'
require 'chapter'

describe Chapter do
  it "intializes chapter with a choice and a serial" do
    new_chapter = Chapter.new("choice", "serial")
  	expect(new_chapter).to be_an_instance_of Chapter
	end

	it "finds a chapter by its ID" do
		new_chapter = Chapter.new("choice", "serial")
		Chapter.chapter_by_id(new_chapter.chapter_id)
		expect(Chapter.chapter_by_id(new_chapter.chapter_id)).to eq(Chapter.all_chapters[0])
	end

	it "adds an associated chapter" do
		new_chapter = Chapter.new("choice", "serial")
		second_chapter = Chapter.new("choice 2", "the story continues")
		new_chapter.add_associated_chapter(second_chapter)
		expect(new_chapter.associated_chapter[0])).to eq(second_chapter.chapter_id)
	end

	it "finds a serial by its ID" do
		new_chapter = Chapter.new("choice", "serial")
		Chapter.serial_by_id(new_chapter.chapter_id)
		expect(Chapter.chapter_by_id(new_chapter.chapter_id)).to eq(Chapter.all_chapters[0])
	end

	
end