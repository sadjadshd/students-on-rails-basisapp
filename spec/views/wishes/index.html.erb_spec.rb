require 'spec_helper'

describe "wishes/index" do
  before(:each) do
    assign(:wishes, [
      stub_model(Wish,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Wish,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of wishes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
