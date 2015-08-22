require 'rails_helper'

RSpec.describe "BbsThreads", type: :request do
  describe "GET /bbs_threads" do
    it "works! (now write some real specs)" do
      get bbs_threads_path
      expect(response).to have_http_status(200)
    end
  end
end
