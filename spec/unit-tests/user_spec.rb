# spec/features/user_registration_spec.rb
require 'rails_helper'

RSpec.feature 'User Registration', type: :feature do
  before :each do
    @user = User.new(name: 'Ali', email: 'ali@gamail.com', password: 'ali', confirmed_at: Time.now)
  end

  it 'validates name is there' do
    @user.name = nil
    expect(@user).not_to be_valid
  end

  it 'validates email is there' do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  context 'association' do
    it 'has many foods' do
      temp = User.reflect_on_association(:foods)
      expect(temp.macro).to eq(:has_many)
    end

    it 'has many recipes' do
      temp = User.reflect_on_association(:recipes)
      expect(temp.macro).to eq(:has_many)
    end
  end
end
