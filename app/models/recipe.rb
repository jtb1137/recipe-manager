class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    accepts_nested_attributes_for :recipe_ingredients
    accepts_nested_attributes_for :ingredients

    # Add ingredients to recipe & find or create new ingredient

end
