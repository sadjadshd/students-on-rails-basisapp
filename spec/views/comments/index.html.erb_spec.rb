require 'spec_helper'

describe "comments/index" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :user => nil,
        :content => "MyText",
        :header => "Header"
      ),
      stub_model(Comment,
        :user => nil,
        :content => "MyText",
        :header => "Header"
      )
    ])
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Header".to_s, :count => 2
  end
end
