require 'rails_helper'

RSpec.describe "bbs_threads/edit", type: :view do
  before(:each) do
    @bbs_thread = assign(:bbs_thread, BbsThread.create!(
      :name => "MyString",
      :address => "MyString",
      :title => "MyString",
      :body => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit bbs_thread form" do
    render

    assert_select "form[action=?][method=?]", bbs_thread_path(@bbs_thread), "post" do

      assert_select "input#bbs_thread_name[name=?]", "bbs_thread[name]"

      assert_select "input#bbs_thread_address[name=?]", "bbs_thread[address]"

      assert_select "input#bbs_thread_title[name=?]", "bbs_thread[title]"

      assert_select "input#bbs_thread_body[name=?]", "bbs_thread[body]"

      assert_select "input#bbs_thread_password[name=?]", "bbs_thread[password]"
    end
  end
end
