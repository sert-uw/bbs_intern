require 'rails_helper'

RSpec.describe Response, type: :model do
  describe 'validation' do
    context 'correct parameters' do
      it { expect(build(:response)).to be_valid }
    end

    context 'wrong parameters' do
      it { expect(build(:response, name: nil)).not_to be_valid }
      it { expect(build(:response, body: nil)).not_to be_valid }
      it { expect(build(:response, password: nil)).not_to be_valid }
    end
  end

  describe 'update_thread_updated' do
    before(:all) {
      @thread1 = create(:bbs_thread)
      sleep(1)
      @thread2 = create(:bbs_thread2)
      sleep(1)
    }

    subject(:first_thread) { BbsThread.order("updated_at DESC").first }

    context 'not create response' do
      it { expect(first_thread).to eq @thread2 }
    end

    context 'create response' do
      before { @thread1.responses.create(attributes_for(:response)) }

      it { expect(first_thread).to eq @thread1 }
    end
  end
end
