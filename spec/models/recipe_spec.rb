require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "should validate title" do
    user = User.create(email: "test1@example.com", username: "test1", password: "password")
    recipe = Recipe.create(category: "default", dietary_restrictions: "default", rating: 0, description: "Default description", ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], instructions: ["Step 1", "Step 2", "Step 3"], image: "recipe1", user_id: user.id)
    expect(recipe.errors[:title]).to_not be_empty
  end
  it "should validate category" do
    user = User.create(email: "test1@example.com", username: "test1", password: "password")
    recipe = Recipe.create(title: "Recipe 1", dietary_restrictions: "default", rating: 0, description: "Default description", ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], instructions: ["Step 1", "Step 2", "Step 3"], image: "recipe1", user_id: user.id)
    expect(recipe.errors[:category]).to_not be_empty
  end
  it "should validate dietary_restrictions" do
    user = User.create(email: "test1@example.com", username: "test1", password: "password")
    recipe = Recipe.create(title: "Recipe 1", category: "default", rating: 0, description: "Default description", ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], instructions: ["Step 1", "Step 2", "Step 3"], image: "recipe1", user_id: user.id)
    expect(recipe.errors[:dietary_restrictions]).to_not be_empty
  end
  it "should validate rating" do
    user = User.create(email: "test1@example.com", username: "test1", password: "password")
    recipe = Recipe.create(title: "Recipe 1", category: "default", dietary_restrictions: "default", description: "Default description", ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], instructions: ["Step 1", "Step 2", "Step 3"], image: "recipe1", user_id: user.id)
    expect(recipe.errors[:rating]).to_not be_empty
  end
  it "should validate description" do
    user = User.create(email: "test1@example.com", username: "test1", password: "password")
    recipe = Recipe.create(title: "Recipe 1", category: "default", dietary_restrictions: "default", rating: 0, ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], instructions: ["Step 1", "Step 2", "Step 3"], image: "recipe1", user_id: user.id)
    expect(recipe.errors[:description]).to_not be_empty
  end
  it "should validate ingredients" do
    user = User.create(email: "test1@example.com", username: "test1", password: "password")
    recipe = Recipe.create(title: "Recipe 1", category: "default", dietary_restrictions: "default", rating: 0, description: "Default description", instructions: ["Step 1", "Step 2", "Step 3"], image: "recipe1", user_id: user.id)
    expect(recipe.errors[:ingredients]).to_not be_empty
  end
  it "should validate instructions" do
    user = User.create(email: "test1@example.com", username: "test1", password: "password")
    recipe = Recipe.create(title: "Recipe 1", category: "default", dietary_restrictions: "default", rating: 0, description: "Default description", ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], image: "recipe1", user_id: user.id)
    expect(recipe.errors[:instructions]).to_not be_empty
  end
  it "should validate image" do
    user = User.create(email: "test1@example.com", username: "test1", password: "password")
    recipe = Recipe.create(title: "Recipe 1", category: "default", dietary_restrictions: "default", rating: 0, description: "Default description", ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], instructions: ["Step 1", "Step 2", "Step 3"], user_id: user.id)
    expect(recipe.errors[:image]).to_not be_empty
  end
  it "should validate user_id" do
    user = User.create(email: "test1@example.com", username: "test1", password: "password")
    recipe = Recipe.create(title: "Recipe 1", category: "default", dietary_restrictions: "default", rating: 0, description: "Default description", ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], instructions: ["Step 1", "Step 2", "Step 3"], image: "recipe1")
    expect(recipe.errors[:user_id]).to_not be_empty
  end
end
