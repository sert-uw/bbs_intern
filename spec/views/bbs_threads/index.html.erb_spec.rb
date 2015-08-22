require 'rails_helper'

RSpec.describe "bbs_threads/index", type: :view do
  before(:each) do
    assign(:bbs_threads, [
      BbsThread.create!(
        :name => "Name",
        :address => "Address",
        :title => "Title",
        :body => "Body",
        :password => "Password"
      ),
      BbsThread.create!(
        :name => "Name",
        :address => "Address",
        :title => "Title",
        :body => "Body",
        :password => "Password"
      )
    ])
  end

  it "renders a list of bbs_threads" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
