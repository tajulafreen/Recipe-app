class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, dependent: :destroy, class_name: 'RecipeFood'
  has_and_belongs_to_many :foods, join_table: 'recipe_foods'

  validates :is_public, inclusion: { in: [true, false] }
  validates :name, :preparation_time_minutes, :cooking_time_minutes, presence: true
  validates :preparation_time_minutes, :cooking_time_minutes, numericality: { only_integer: true }
end
