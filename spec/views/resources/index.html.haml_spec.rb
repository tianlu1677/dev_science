require 'rails_helper'

RSpec.describe "resources/index", type: :view do
  before(:each) do
    assign(:resources, [
      Resource.create!(
        :user_id => 1,
        :title => "Title"
      ),
      Resource.create!(
        :user_id => 1,
        :title => "Title"
      )
    ])
  end

  it "renders a list of resources" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
