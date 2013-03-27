require 'spec_helper'

describe "divisions/new" do
  before(:each) do
    assign(:division, stub_model(Division,
      :name => "MyString",
      :lead_person_id => 1,
      :admin_user_id => 1,
      :project_id => 1
    ).as_new_record)
  end

  it "renders new division form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", divisions_path, "post" do
      assert_select "input#division_name[name=?]", "division[name]"
      assert_select "input#division_lead_person_id[name=?]", "division[lead_person_id]"
      assert_select "input#division_admin_user_id[name=?]", "division[admin_user_id]"
      assert_select "input#division_project_id[name=?]", "division[project_id]"
    end
  end
end
