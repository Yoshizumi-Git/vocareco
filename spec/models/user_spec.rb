require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a username" do
      user = build(:user,username:nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user,password:nil,password_confirmation:nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a nickname that has more than 7 characters " do
      user = build(:user, password: "1234",password_confirmation:"1234")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

  end
end