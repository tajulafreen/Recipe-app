class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  validates :name, presence: true
end
