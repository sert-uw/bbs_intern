require 'rails_helper'

RSpec.describe BbsThread, type: :model do
  describe 'validation' do
    context 'correct parameters' do
      it { expect(build(:bbs_thread)).to be_valid }
    end

    context 'wrong parameters' do
      it { expect(build(:bbs_thread, name: nil)).not_to be_valid }
      it { expect(build(:bbs_thread, body: nil)).not_to be_valid }
      it { expect(build(:bbs_thread, password: nil)).not_to be_valid }
    end
  end

  describe 'password authentication' do
    before(:each) { @thread = create(:bbs_thread) }

    context 'correct password' do
      let(:delete_params) { { password: @thread.password } }

      it { expect(@thread.destroy_validation delete_params).to eq true }
    end

    context 'incorrect password' do
      let(:delete_params) { { password: "" } }

      it { expect(@thread.destroy_validation delete_params).to eq false }
    end
  end
end
