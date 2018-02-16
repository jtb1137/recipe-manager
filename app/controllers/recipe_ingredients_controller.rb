class RecipeIngredientsController < ApplicationController
    def index
    end

    def new
        @recipe_ingredient = RecipeIngredient.new
        @ingredient = Ingredient.new
    end

    def update
    end
end