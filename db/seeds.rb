class Unit < ActiveRecord::Base
  belongs_to :list
end

class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:tags)
  has_many :lists
  has_many :ingredients, through: :lists
  has_many :steps
end

units = [
  'teaspoon(s) (tsp.)',
  'tablespoon(s) (tbsp.)',
  'fluid ounce(s) (fl oz)',
  'gill(s) (~1/2 cup)',
  'cup(s) (c)',
  'pound(s) (lbs)',
  'ounce(s) (oz)',
  'gram(s) (g)'
]

cookies_recipe = Recipe.create(:name => "Chocolate Chip Cookies", :rating => 4)
curry_recipe = Recipe.create(:name => "Massaman", :rating => 5)
meatloaf_recipe = Recipe.create(:name => "Brown Sugar Glazed Meatloaf", :rating => 4)


units.each do |name|
  Unit.create({:name => name})
end
