require 'spec_helper'

describe "wishlists/edit" do
  before(:each) do
    @wishlist = assign(:wishlist, stub_model(Wishlist,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit wishlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wishlist_path(@wishlist), "post" do
      assert_select "input#wishlist_name[name=?]", "wishlist[name]"
      assert_select "textarea#wishlist_description[name=?]", "wishlist[description]"
    end
  end
end
