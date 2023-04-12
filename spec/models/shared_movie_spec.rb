require 'rails_helper'

RSpec.describe SharedMovie, type: :model do
  context "validations" do
    let(:user) { User.create email: "test@gmail.com", password: "123456" }

    subject do
      described_class.new(
        url: "https://www.youtube.com/embed/iuk77TjvfmE",
        title: "Marvel Studios’ The Marvels | Teaser Trailer",
        user: user
      )
    end

    describe "with an url and title and belongs to an user" do
      it { is_expected.to be_valid }
    end

    describe "without an url" do
      it do
        subject.url = nil
        is_expected.to be_invalid
      end
    end

    describe "without a title" do
      it do
        subject.title = nil
        is_expected.to be_invalid
      end
    end

    describe "without an user" do
      it do
        subject.user = nil
        is_expected.to be_invalid
      end
    end
  end

  context "associations" do
    it { should belong_to(:user) }
  end
end
