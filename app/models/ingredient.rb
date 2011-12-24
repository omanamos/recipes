class Ingredient < ActiveRecord::Base
  validates_presence_of :recipe, :item, :amount
  belongs_to :recipe
end
