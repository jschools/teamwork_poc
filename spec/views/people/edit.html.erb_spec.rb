require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :first => "MyString",
      :last => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_path(@person), "post" do
      assert_select "input#person_first[name=?]", "person[first]"
      assert_select "input#person_last[name=?]", "person[last]"
      assert_select "input#person_email[name=?]", "person[email]"
    end
  end
end
