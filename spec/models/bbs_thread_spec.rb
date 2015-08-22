require 'rails_helper'

RSpec.describe BbsThread, type: :model do
  describe 'validation' do
    context 'correct parameters' do
      it { expect(build(:bbs_thread)).to be_valid }
    end

    context 'wrong parameters' do
      it { expect(build(:bbs_thread, name: nil)).not_to be_valid }
      it { expect(build(:bbs_thread, address: nil)).not_to be_valid }
      it { expect(build(:bbs_thread, title: nil)).not_to be_valid }
      it { expect(build(:bbs_thread, body: nil)).not_to be_valid }
      it { expect(build(:bbs_thread, password: nil)).not_to be_valid }
    end
  end
end
