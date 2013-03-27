require 'spec_helper'

describe "people/new" do
	before(:each) do
		assign(:person, stub_model(Person,
			:first => "MyString",
			:last => "MyString",
			:email => "MyString"
		).as_new_record)
	end

	it "renders new person form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form[action=?][method=?]", people_path, "post" do
			assert_select "input#person_first[name=?]", "person[first]"
			assert_select "input#person_last[name=?]", "person[last]"
			assert_select "input#person_email[name=?]", "person[email]"
		end
	end
end
