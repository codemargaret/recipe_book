class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:tags)
  has_many :lists
  has_many :ingredients, through: :lists
  has_many :steps

  validates(:name, {:presence => true})
end
