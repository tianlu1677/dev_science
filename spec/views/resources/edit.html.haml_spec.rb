require 'rails_helper'

RSpec.describe "resources/edit", type: :view do
  before(:each) do
    @resource = assign(:resource, Resource.create!(
      :user_id => 1,
      :title => "MyString"
    ))
  end

  it "renders the edit resource form" do
    render

    assert_select "form[action=?][method=?]", resource_path(@resource), "post" do

      assert_select "input#resource_user_id[name=?]", "resource[user_id]"

      assert_select "input#resource_title[name=?]", "resource[title]"
    end
  end
end
