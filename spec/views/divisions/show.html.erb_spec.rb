require 'spec_helper'

describe "divisions/show" do
  before(:each) do
    @division = assign(:division, stub_model(Division,
      :name => "Name",
      :lead_person_id => 1,
      :admin_user_id => 2,
      :project_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
