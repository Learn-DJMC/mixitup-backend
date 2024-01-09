class RecipesController < ApplicationController

    def create
        recipe = Recipe.create(recipe_params)
        if recipe.valid?
            render json: recipe
        else
            render json: recipe.errors, status: 422
        end
    end

    private
    def recipe_params
        params.require(:recipe).permit(:title, :category, :dietary_restrictions, :rating, :description, :image, :user_id, ingredients:[], instructions:[])
    end
end
