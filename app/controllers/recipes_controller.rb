class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
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
    end

    def destroy
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :description)
    end

    def set_recipe
    end
end
