require 'rails_helper'

describe City, type: :model do
  subject { FactoryBot.create(:city) }

  describe 'Validation' do
    context 'When all attributes is present' do
      it { is_expected.to be_valid }

      it 'response to methods' do
        is_expected.to respond_to(:name)
        is_expected.to respond_to(:latitude)
        is_expected.to respond_to(:longitude)
      end
    end

    context 'When name is empty' do
      it 'not be valid' do
        subject.name = ' '
        is_expected.not_to be_valid
      end
    end

    context 'When latitude is empty' do
      it 'not be valid' do
        subject.latitude = ' '
        is_expected.not_to be_valid
      end
    end

    context 'When longitude is empty' do
      it 'not be valid' do
        subject.longitude = ' '
        is_expected.not_to be_valid
      end
    end
  end
end
