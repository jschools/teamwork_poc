require 'spec_helper'

describe "people/index" do
	before(:each) do
		assign(:people, [
			stub_model(Person,
				:first => "First",
				:last => "Last",
				:email => "Email"
			),
			stub_model(Person,
				:first => "First",
				:last => "Last",
				:email => "Email"
			)
		])
	end

	it "renders a list of people" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "tr>td", :text => "First".to_s, :count => 2
		assert_select "tr>td", :text => "Last".to_s, :count => 2
		assert_select "tr>td", :text => "Email".to_s, :count => 2
	end
end
