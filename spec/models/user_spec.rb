require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
  
    it "is valid with valid attributes" do
      user = User.new(
                      name: 'Andrew Fox',
                      email: 'andy@andy.net',
                      password: 'andrewFox123',
                      password_confirmation: 'andrewFox123'
      )
      expect(user).to be_valid
    end

       it "is not valid without a name and password" do
      user = User.create(
                      name: nil,
                      email: 'andy@andy.net',
                      password: nil,
                      password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "should create a new user if password and password_confirmation match" do
      user = User.create(
                      name: 'Andrew Fox',
                      email: 'andy@andy.net',
                      password: 'password',
                      password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it "email must be unique" do
      user = User.create(
                      name: "Andrew Fox",
                      email: 'andy@andy.net',
                      password: 'password',
                      password_confirmation: 'password'
      )
      user2 = User.create(
                      name: 'Andy Fox',
                      email: 'andy@andy.net',
                      password: 'newpassword',
                      password_confirmation: 'newpassword'
      )
     
      expect(user).to be_valid
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages[0]).to eq "Email has already been taken"
    end

    it "not valid when password length is less than 8 characters" do
      user = User.create(
                          name: "Andrew Fox",
                          email: 'andy@andy.net',
                          password: '123',
                          password_confirmation: '123'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages[0]).to eq 'Password is too short (minimum is 8 characters)'
    end
  end

  describe '.authenticate_with_credentials' do
    it "authenticates with the correct user credentials" do
      user = User.create(
                          name: "Andrew Fox",
                          email: 'andy@andy.net',
                          password: 'password123',
                          password_confirmation: 'password123'
      )
      expect(user).to be_valid
      userCredentials = User.authenticate_with_credentials('name@email.com', 'password')

      expect(userCredentials).to be_nil
    end

    it "authentication failure with incorrect password" do
      user = User.create(
                        name: "Andrew Fox",
                        email: 'andy@andy.net',
                        password: 'password123',
                        password_confirmation: 'password123'
    )
    userCredentials = User.authenticate_with_credentials('test@wrongtest.net', 'invalidpassword')

    expect(userCredentials).to be_nil
    end
  end
end

