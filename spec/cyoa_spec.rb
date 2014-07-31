require 'cyoa_spec'
require 'chapter'

describe Chapter do
  it "intializes chapter with a choice and a serial" do
    new_chapter = Chapter.new("choice", "serial")
  	expect(new_chapter).to be_an_instance_of Chapter
	end
end