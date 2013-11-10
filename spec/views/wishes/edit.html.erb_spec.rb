require 'spec_helper'

describe "wishes/edit" do
  before(:each) do
    @wish = assign(:wish, stub_model(Wish,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit wish form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wish_path(@wish), "post" do
      assert_select "input#wish_name[name=?]", "wish[name]"
      assert_select "textarea#wish_description[name=?]", "wish[description]"
    end
  end
end
