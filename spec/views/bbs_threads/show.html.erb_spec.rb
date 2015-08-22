require 'rails_helper'

RSpec.describe "bbs_threads/show", type: :view do
  before(:each) do
    @bbs_thread = assign(:bbs_thread, BbsThread.create!(
      :name => "Name",
      :address => "Address",
      :title => "Title",
      :body => "Body",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/Password/)
  end
end
