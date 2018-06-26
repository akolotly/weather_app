require 'rails_helper'

describe User, type: :model do
  subject { FactoryBot.create(:user) }
  
  describe 'Validation' do
    context 'When all attributes is present' do
      it { is_expected.to be_valid }

      it 'response to methods' do
        is_expected.to respond_to(:email)
        is_expected.to respond_to(:password)
      end
    end

    context 'When email is empty' do
      it 'not be valid' do
        subject.email = ' '
        is_expected.not_to be_valid
      end
    end

    context "When email format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com foo@bar..com]
        addresses.each do |invalid_address|
          subject.email = invalid_address
          is_expected.not_to be_valid
        end
      end
    end

    context "When email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          subject.email = valid_address
          is_expected.to be_valid
        end
      end
    end

    context "When email address is already taken" do
      before do
        @user_with_same_email = subject.dup
      end

      it { expect(@user_with_same_email).not_to be_valid }
    end

    context "with a password that's too short" do
      before { subject.password = 'a' * 5 }
      it { is_expected.not_to be_valid }
    end
  end
end

