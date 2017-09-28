class Unit < ActiveRecord::Base
  belongs_to :list
end

class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:tags)
  has_many :lists
  has_many :ingredients, through: :lists
  has_many :steps
end

class Ingredient < ActiveRecord::Base
  has_many :lists
  has_many :recipes, through: :lists
end

class Tag < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
end

class List < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  belongs_to :unit
end

class Step < ActiveRecord::Base
  belongs_to :recipe
end


units = [
  'teaspoon(s)',
  'tablespoon(s)',
  'fluid ounce(s)',
  'gill(s)',
  'cup(s)',
  'pound(s)',
  'ounce(s)',
  'gram(s)',
  'unit(s)'
]

ingredients = [
  'flour',
  'egg(s)',
  'sugar',
  'salt',
  'milk',
  'pepper',
  'butter',
  'baking soda',
  'chicken',
  'beef',
  'rice',
  'beans',
  'broccoli',
  'lettuce',
  'tomato',
  'onion',
  'potato'
]

tags = [
  'breakfast',
  'lunch',
  'dinner',
  'dessert',
  'Asian',
  'Italian'
]

units.each do |name|
  Unit.create({:name => name})
end

ingredients.each do |name|
  Ingredient.create({:name => name})
end

tags.each do |name|
  Tag.create({:name => name})
end

cookies_recipe = Recipe.create(:name => "Chocolate Chip Cookies", :rating => 4)
ingredient1 = Ingredient.find(1)
ingredient2 = Ingredient.find(2)
cookies_recipe.lists.create(:ingredient => ingredient1, :quantity => "2", :unit_id => 5)
cookies_recipe.lists.create(:ingredient => ingredient2, :quantity => "2", :unit_id => 9)
Step.create({:name => "Bake for 45 mins at 350 degrees", :recipe_id => cookies_recipe.id, :step_num => cookies_recipe.steps.count + 1})

curry_recipe = Recipe.create(:name => "Massaman", :rating => 5)
ingredient1 = Ingredient.find(17)
ingredient2 = Ingredient.find(16)
curry_recipe.lists.create(:ingredient => ingredient1, :quantity => "1/2", :unit_id => 5)
curry_recipe.lists.create(:ingredient => ingredient2, :quantity => "1/3", :unit_id => 5)
Step.create({:name => "Enjoy with rice", :recipe_id => curry_recipe.id, :step_num => curry_recipe.steps.count + 1})

meatloaf_recipe = Recipe.create(:name => "Brown Sugar Glazed Meatloaf", :rating => 4)
ingredient1 = Ingredient.find(10)
ingredient2 = Ingredient.find(2)
meatloaf_recipe.lists.create(:ingredient => ingredient1, :quantity => "2 1/2", :unit_id => 5)
meatloaf_recipe.lists.create(:ingredient => ingredient2, :quantity => "3", :unit_id => 9)
Step.create({:name => "Don't forget broccolis", :recipe_id => meatloaf_recipe.id, :step_num => meatloaf_recipe.steps.count + 1})
