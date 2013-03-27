require 'spec_helper'

describe "divisions/index" do
  before(:each) do
    assign(:divisions, [
      stub_model(Division,
        :name => "Name",
        :lead_person_id => 1,
        :admin_user_id => 2,
        :project_id => 3
      ),
      stub_model(Division,
        :name => "Name",
        :lead_person_id => 1,
        :admin_user_id => 2,
        :project_id => 3
      )
    ])
  end

  it "renders a list of divisions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
