require 'rails_helper'

RSpec.describe 'PubicRecipe specs', type: :feature do
  before(:each) do
    Recipe.delete_all

    @user = User.create!(name: 'rocky', email: 'test@gmail.com', password: 'abcxyz123',
                         password_confirmation: 'abcxyz123', confirmed_at: Time.now)
    @recipe1 = Recipe.create(user: @user, name: 'Kabsah', description: 'The best in the west', cooking_time_minutes: 45,
                             preparation_time_minutes: 40, is_public: true)
    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit public_recipes_path
  end

  it 'see the title' do
    expect(page).to have_content('Public Recipes')
  end
  it 'see the card' do
    expect(page).to have_content('Kabsah')
  end
  it 'see name of recipe owner' do
    expect(page).to have_content('rocky')
  end
end
