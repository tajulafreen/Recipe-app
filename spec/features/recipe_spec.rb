require 'rails_helper'

RSpec.describe 'Recipe specs', type: :feature do
  before(:each) do
    Recipe.delete_all

    @user = User.create!(name: 'rocky', email: 'test@gmail.com', password: 'abc123',
                         password_confirmation: 'abc123', confirmed_at: Time.now)
    @recipe = Recipe.create(user: @user, name: 'Kabsah', description: 'The best in the west', cooking_time_minutes: 45,
                            preparation_time_minutes: 40, is_public: true)
    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit recipes_path
  end

  it 'see the title' do
    expect(page).to have_content('Recipes')
    expect(page).to have_content('The best in the west')
  end

  it 'see the recipe details' do
    visit recipe_path(@recipe) # Visit the show page for @recipe

    # Test that the recipe details are displayed correctly
    expect(page).to have_content('Kabsah')
    expect(page).to have_content('The best in the west')
    expect(page).to have_content("Preparation Time: #{@recipe.preparation_time_minutes} minutes")
    expect(page).to have_content("Cooking Time: #{@recipe.cooking_time_minutes} minutes") # Update
  end
  it 'create new recipe' do
    click_on 'Add New Recipe'
    expect(page).to have_content('Public or private')
  end
end
