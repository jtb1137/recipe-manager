class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
        @recipe_ingredients = @recipe.recipe_ingredients.build
        @ingredient = @recipe.ingredients.build
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
            # Add ingredients to recipe & find or create new ingredient
            flash[:alert] = "Success"
            redirect_to recipe_path(@recipe)
        else
            flash[:alert] = "Failure"
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @recipe.save
            flash[:alert] = "Success"
            redirect_to recipe_path(@recipe)
        else
            flash[:alert] = "Failure"
            render 'edit'
        end
    end

    def destroy
        @recipe.destroy
        redirect_to root_path
    end

    private
    def recipe_params
        params.require(:recipe).permit(:id, :name, :description, recipe_ingredients_attributes: [ :quantity, :unit_type, ingredient_attributes: [:id, :name]])
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end
