class Food < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, class_name: 'RecipeFood'
  has_and_belongs_to_many :recipes, join_table: 'recipe_foods'

  validates :name, :measurement_unit, :price, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
end
