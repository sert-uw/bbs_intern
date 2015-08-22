require 'rails_helper'

RSpec.describe Response, type: :model do
  describe 'validation' do
    context 'correct parameters' do
      it { expect(build(:response)).to be_valid }
    end

    context 'wrong parameters' do
      it { expect(build(:response, name: nil)).not_to be_valid }
      it { expect(build(:response, address: nil)).not_to be_valid }
      it { expect(build(:response, body: nil)).not_to be_valid }
      it { expect(build(:response, password: nil)).not_to be_valid }
    end
  end
end
