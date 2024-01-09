class RecipesController < ApplicationController

    def create
        recipe = Recipe.create!(recipe_params)
        render json: recipe
    end

    private
    def recipe_params
        params.require(:recipe).permit(:title, :category, :dietary_restrictions, :rating, :description, :image, :user_id, ingredients:[], instructions:[])
    end
end
