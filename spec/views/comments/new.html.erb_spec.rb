require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :user => nil,
      :content => "MyText",
      :header => "MyString"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input#comment_user[name=?]", "comment[user]"
      assert_select "textarea#comment_content[name=?]", "comment[content]"
      assert_select "input#comment_header[name=?]", "comment[header]"
    end
  end
end
