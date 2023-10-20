require 'rails_helper'

RSpec.describe 'Recipe specs', type: :feature do
  before(:each) do
    Recipe.delete_all

    @user = User.create!(name: 'affu', email: 'afreen@gmail.com', password: 'xyz123',
                         password_confirmation: 'xyz123', confirmed_at: Time.now)
    @recipe1 = Recipe.create(user: @user, name: 'Kabsah', description: 'The best in the west', cooking_time_minutes: 45,
                             preparation_time_minutes: 40, is_public: true)
    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit new_recipe_recipe_food_path(@recipe1)
  end

  it 'show the content of select' do
    expect(page).to have_content('Select a food')
  end
  it 'show the button' do
    expect(page).to have_button('Create Ingredient')
  end
end
