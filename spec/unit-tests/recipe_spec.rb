require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @recipe = Recipe.create(name: 'Biryani', preparation_time_minutes: '15 Min', cooking_time_minutes: '1 Hour',
                            description: 'Rice with chicken')
  end

  context 'Recipe validations' do
    it 'is not valid without name' do
      @recipe.name = nil
      expect(@recipe).not_to be_valid
    end

    it 'is not valid without preparattion time' do
      @recipe.preparation_time_minutes = nil
      expect(@recipe).not_to be_valid
    end

    it 'is not valid without cooking time' do
      @recipe.cooking_time_minutes = nil
      expect(@recipe).not_to be_valid
    end

    it 'is not valid without description' do
      @recipe.description = nil
      expect(@recipe).not_to be_valid
    end
  end

  context 'Recipe associations' do
    it 'belongs to user' do
      temp = Recipe.reflect_on_association(:user)
      expect(temp.macro).to eq(:belongs_to)
    end
  end
end