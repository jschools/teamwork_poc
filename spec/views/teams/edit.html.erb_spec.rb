require 'spec_helper'

describe "teams/edit" do
  before(:each) do
    @team = assign(:team, stub_model(Team,
      :name => "MyString",
      :division_id => 1,
      :lead_person_id => 1,
      :admin_user_id => 1
    ))
  end

  it "renders the edit team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", team_path(@team), "post" do
      assert_select "input#team_name[name=?]", "team[name]"
      assert_select "input#team_division_id[name=?]", "team[division_id]"
      assert_select "input#team_lead_person_id[name=?]", "team[lead_person_id]"
      assert_select "input#team_admin_user_id[name=?]", "team[admin_user_id]"
    end
  end
end
