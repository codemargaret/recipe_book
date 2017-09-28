class Unit < ActiveRecord::Base
  belongs_to :list
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

units.each do |name|
  Unit.create({:name => name})
end
