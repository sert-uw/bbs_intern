require 'rails_helper'

RSpec.describe "responses/index", type: :view do
  before(:each) do
    assign(:responses, [
      Response.create!(
        :name => "Name",
        :address => "Address",
        :body => "Body",
        :password => "Password"
      ),
      Response.create!(
        :name => "Name",
        :address => "Address",
        :body => "Body",
        :password => "Password"
      )
    ])
  end

  it "renders a list of responses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
