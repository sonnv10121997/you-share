require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    subject { described_class.new email: "test@gmail.com", password: "123456" }

    describe "with an email and password" do
      it { is_expected.to be_valid }
    end

    describe "with an email already exist" do
      before { described_class.create email: "test@gmail.com", password: "123456" }

      it { is_expected.to be_invalid }
    end

    describe "with a password confirmation does not match" do
      it do
        subject.password_confirmation = "654321"
        is_expected.to be_invalid
      end
    end

    describe "with 5 characters password" do
      it do
        subject.password = "12345"
        is_expected.to be_invalid
      end
    end

    describe "without an email" do
      it do
        subject.email = nil
        is_expected.to be_invalid
      end
    end

    describe "without a password" do
      it do
        subject.password = nil
        is_expected.to be_invalid
      end
    end
  end

  context "associations" do
    it { should have_many(:shared_movies) }
  end
end
