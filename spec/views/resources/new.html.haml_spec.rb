require 'rails_helper'

RSpec.describe "resources/new", type: :view do
  before(:each) do
    assign(:resource, Resource.new(
      :user_id => 1,
      :title => "MyString"
    ))
  end

  it "renders new resource form" do
    render

    assert_select "form[action=?][method=?]", resources_path, "post" do

      assert_select "input#resource_user_id[name=?]", "resource[user_id]"

      assert_select "input#resource_title[name=?]", "resource[title]"
    end
  end
end
