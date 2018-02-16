class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.create(recipe_params)

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
        params.require(:recipe).permit(:name, :description)
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end
