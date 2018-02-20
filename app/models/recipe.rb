class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    # Add ingredients to recipe & find or create new ingredient

end
