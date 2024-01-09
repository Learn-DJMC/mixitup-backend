require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "Get /index" do
    it 'gets a list of recipes' do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      Recipe.create(
        title: "recipe 1",
        category: "default",
        dietary_restrictions: "default",
        rating: 0,
        description: "default description",
        ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
        instructions: ["Step 1", "Step 2", "Step 3"],
        image: "recipe1",
        user_id: user.id
      )
      get '/recipes'
  
      recipe = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipe.first['title']).to eq('recipe 1')
      expect(recipe.first['category']).to eq('default')
      expect(recipe.first['dietary_restrictions']).to eq('default')
      expect(recipe.first['rating']).to eq(0)
      expect(recipe.first['description']).to eq('default description')
      expect(recipe.first['ingredients']).to eq(["Ingredient 1", "Ingredient 2", "Ingredient 3"])
      expect(recipe.first['instructions']).to eq(["Step 1", "Step 2", "Step 3"])
      expect(recipe.first['image']).to eq('recipe1')
    end
  end

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
    end
  end
  
  describe "cannot create a recipe without valid attributes" do
    it "doesn't create a recipe without a title" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe_params = {
        recipe: {
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
      expect(response.status).to eq 422
      recipe = JSON.parse(response.body)
      expect(recipe["title"]).to include "can't be blank"
    end
    it "doesn't create a recipe without a category" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe_params = {
        recipe: {
          title: "Recipe 1",
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
      expect(response.status).to eq 422
      recipe = JSON.parse(response.body)
      expect(recipe["category"]).to include "can't be blank"
    end
    it "doesn't create a recipe without dietary_restrictions" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe_params = {
        recipe: {
          title: "Recipe 1",
          category: "default",
          rating: 0,
          description: "Default description",
          ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
          instructions: ["Step 1", "Step 2", "Step 3"],
          image: "recipe1",
          user_id: user.id
        }
      }
      post "/recipes", params: recipe_params
      expect(response.status).to eq 422
      recipe = JSON.parse(response.body)
      expect(recipe["dietary_restrictions"]).to include "can't be blank"
    end
    it "doesn't create a recipe without a rating" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe_params = {
        recipe: {
          title: "Recipe 1",
          category: "default",
          dietary_restrictions: "default",
          description: "Default description",
          ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
          instructions: ["Step 1", "Step 2", "Step 3"],
          image: "recipe1",
          user_id: user.id
        }
      }
      post "/recipes", params: recipe_params
      expect(response.status).to eq 422
      recipe = JSON.parse(response.body)
      expect(recipe["rating"]).to include "can't be blank"
    end
    it "doesn't create a recipe without a description" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe_params = {
        recipe: {
          title: "Recipe 1",
          category: "default",
          dietary_restrictions: "default",
          rating: 0,
          ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
          instructions: ["Step 1", "Step 2", "Step 3"],
          image: "recipe1",
          user_id: user.id
        }
      }
      post "/recipes", params: recipe_params
      expect(response.status).to eq 422
      recipe = JSON.parse(response.body)
      expect(recipe["description"]).to include "can't be blank"
    end
    it "doesn't create a recipe without ingredients" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe_params = {
        recipe: {
          title: "Recipe 1",
          category: "default",
          dietary_restrictions: "default",
          rating: 0,
          description: "Default description",
          instructions: ["Step 1", "Step 2", "Step 3"],
          image: "recipe1",
          user_id: user.id
        }
      }
      post "/recipes", params: recipe_params
      expect(response.status).to eq 422
      recipe = JSON.parse(response.body)
      expect(recipe["ingredients"]).to include "can't be blank"
    end
    it "doesn't create a recipe without instructions" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe_params = {
        recipe: {
          title: "Recipe 1",
          category: "default",
          dietary_restrictions: "default",
          rating: 0,
          description: "Default description",
          ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
          image: "recipe1",
          user_id: user.id
        }
      }
      post "/recipes", params: recipe_params
      expect(response.status).to eq 422
      recipe = JSON.parse(response.body)
      expect(recipe["instructions"]).to include "can't be blank"
    end
    it "doesn't create a recipe without an image" do
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
          user_id: user.id
        }
      }
      post "/recipes", params: recipe_params
      expect(response.status).to eq 422
      recipe = JSON.parse(response.body)
      expect(recipe["image"]).to include "can't be blank"
    end
    it "doesn't create a recipe without a user_id" do
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
        }
      }
      post "/recipes", params: recipe_params
      expect(response.status).to eq 422
      recipe = JSON.parse(response.body)
      expect(recipe["user_id"]).to include "can't be blank"
    end
  end

  describe "PATCH /update" do
    it "updates a recipe" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe = Recipe.create(
        title: "Recipe 1",
          category: "default",
          dietary_restrictions: "default",
          rating: 0,
          description: "Default description",
          ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
          instructions: ["Step 1", "Step 2", "Step 3"],
          image: "recipe1",
          user_id: user.id
      )
      recipe_params = {
        recipe: {
          title: "Recipe 2",
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
      patch "/recipes/#{recipe.id}", params: recipe_params

      expect(response).to have_http_status(200)
      updated_recipe = Recipe.find(recipe.id)
      expect(updated_recipe.title).to eq "Recipe 2"
    end
    it "doesnt update with a nonexistent id" do
      user = User.create(email: "test@example.com", username: "test", password: "password")
      recipe = Recipe.create(
          title: "Recipe 1",
          category: "default",
          dietary_restrictions: "default",
          rating: 0,
          description: "Default description",
          ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
          instructions: ["Step 1", "Step 2", "Step 3"],
          image: "recipe1",
          user_id: user.id
      )
      recipe_params = {
        recipe: {
          title: "",
          category: "",
          dietary_restrictions: "",
          rating: nil,
          description: "",
          ingredients: [""],
          instructions: [""],
          image: "",
          user_id: nil
        }
      }
      patch "/recipes/#{recipe.id}", params: recipe_params
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /destroy" do
    it "deletes a recipe" do
    user = User.create(email: "test@example.com", username: "test", password: "password")
    recipe = Recipe.create(
      title: "Recipe 1",
      category: "default",
      dietary_restrictions: "default",
      rating: 0,
      description: "Default description",
      ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
      instructions: ["Step 1", "Step 2", "Step 3"],
      image: "recipe1",
      user_id: user.id
      )

      delete "/recipes/#{recipe.id}"
      expect(response.status).to eq (200)
      recipe = Recipe.all
      expect(recipe).to be_empty
    end
    it "doesn't remove an recipe with an invalid ID" do
      expect { delete "/recipes/invalid_id" }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it "doesn't remove an recipe with no ID" do
      expect { delete "/recipes/"}.to raise_error(ActionController::RoutingError)
    end
  end
end
