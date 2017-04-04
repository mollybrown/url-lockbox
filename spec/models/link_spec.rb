require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "validations" do
    context "invalid attributes" do

      it "is invalid without a url" do
        user = Link.new(title: "Google")
        expect(user).to be_invalid
      end

      it "is invalid without a title" do
        user = Link.new(url: "http://www.google.com")
        expect(user).to be_invalid
      end

    end
  end
end
