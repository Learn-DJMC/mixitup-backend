require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "POST /create" do
    it "creates a recipe" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe_params = {
        recipe: {
          title: "Recipe 1",
          category: "default",
          dietary_restrictions: "default",
          rating: 0,
          description: "Default description",
          ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
          instructions: ["Step 1", "Step 2", "Step 3"],
          image: "recipe1",
          user_id: user.id
        }
      }
    post "/recipes", params: recipe_params
    expect(response).to have_http_status(200)
    recipe = Recipe.first
    expect(recipe.title).to eq "Recipe 1"
    puts "Recipe: #{recipe.ingredients}"
    end
  end
end
