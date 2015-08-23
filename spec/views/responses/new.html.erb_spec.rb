require 'rails_helper'

RSpec.describe "responses/new", type: :view do
  before(:each) do
    assign(:response, Response.new(
      :name => "MyString",
      :address => "MyString",
      :body => "MyString",
      :password => "MyString"
    ))
  end

  it "renders new response form" do
    render

    assert_select "form[action=?][method=?]", responses_path, "post" do

      assert_select "input#response_name[name=?]", "response[name]"

      assert_select "input#response_address[name=?]", "response[address]"

      assert_select "input#response_body[name=?]", "response[body]"

      assert_select "input#response_password[name=?]", "response[password]"
    end
  end
end
