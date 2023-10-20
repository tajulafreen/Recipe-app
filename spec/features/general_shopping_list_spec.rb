require 'rails_helper'

RSpec.describe 'General shopping list specs', type: :feature do
  before(:each) do
    Recipe.delete_all

    @user = User.create!(name: 'rocky', email: 'test1@gmail.com', password: 'abcxyz123',
                         password_confirmation: 'abcxyz123', confirmed_at: Time.now)
    @recipe = Recipe.create(user: @user, name: 'Kabab', description: 'The best in the west', cooking_time_minutes: 45,
                             preparation_time_minutes: 40, is_public: true)
    @food = Food.create(user: @user, name: 'Test Food 101', measurement_unit: 'Gram', price: 9.99, quantity: 10)
    RecipeFood.create(food: @food, recipe: @recipe, quantity: 1)
    puts @recipe.id
    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit general_shopping_list_recipe_path(@recipe)
  end

  it 'see the title' do
    expect(page).to have_content('Shopping list')
  end
  it 'see some page features' do
    expect(page).to have_content('Amount of food to buy:')
  end
end