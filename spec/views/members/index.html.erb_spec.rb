require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :name => "Name",
        :original_url => "Original Url",
        :short_url => "Short Url"
      ),
      Member.create!(
        :name => "Name",
        :original_url => "Original Url",
        :short_url => "Short Url"
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Original Url".to_s, :count => 2
    assert_select "tr>td", :text => "Short Url".to_s, :count => 2
  end
end
