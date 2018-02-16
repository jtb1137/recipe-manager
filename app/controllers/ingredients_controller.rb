class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:show, :edit, :update, :delete]

    def index
        @ingredients = Ingredient.all
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save
            flash[:alert] = "Success"
            redirect_to ingredient_path(@ingredient)
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
        if @ingredient.save
            flash[:alert] = "Success"
            redirect_to ingredient_path(@ingredient)
        else
            flash[:alert] = "Failure"
            render 'edit'
        end
    end

    def delete
        @ingredient.destroy
        redirect_to ingredients_path
    end
    
    private
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

end
