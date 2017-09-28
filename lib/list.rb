class List < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  has_many :units
end
