require 'rails_helper'

RSpec.describe "responses/edit", type: :view do
  before(:each) do
    @response = assign(:response, Response.create!(
      :name => "MyString",
      :address => "MyString",
      :body => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit response form" do
    render

    assert_select "form[action=?][method=?]", response_path(@response), "post" do

      assert_select "input#response_name[name=?]", "response[name]"

      assert_select "input#response_address[name=?]", "response[address]"

      assert_select "input#response_body[name=?]", "response[body]"

      assert_select "input#response_password[name=?]", "response[password]"
    end
  end
end
