require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(first_name: "test", last_name: "test", email: "test@test.com", password: "12345", password_confirmation: "12345")
    end

    it 'validate email is present' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'validate first name is present' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'validate last name is present' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it 'validate password is present' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'validate password is minimum length' do
      @user.password = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
    it 'validate password confirmation is present' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'validate password and password confirmation match' do
      @user.password = "osc@r"
      @user.password_confirmation = "Osc@r33"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'Emails must be unique' do
      priorUser = User.new(:first_name => "Jeff", :last_name => "Gebert", :email => "test@test.com", :password => "osc@r", :password_confirmation => "osc@r")
      priorUser.save
      @user.save
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
    it 'Emails must be unique case sensitivity' do
      priorUser = User.new(:first_name => "Jeff", :last_name => "Gebert", :email => "test@test.com", :password => "osc@r", :password_confirmation => "osc@r")
      priorUser.save
      @user.email = "TEST@TEST.com"
      @user.save
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
    @user = User.new(first_name: "Jeff", last_name: "Gebert", email: "test@test.com", password: "osc@r", password_confirmation: "osc@r")
    end

    it "is still able to authenticate with whitespaces in the email" do
      @user.save
      expect(User.authenticate_with_credentials("test@test.com ", "osc@r")).not_to be_nil
    end

    it "is still able to authenticate even with wrong cases in the email" do
      @user.save
      expect(User.authenticate_with_credentials("TeSt@TEST.cOm", "osc@r")).not_to be_nil
    end
  end
end
