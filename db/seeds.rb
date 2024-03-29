# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.where(email: "test1@example.com", username: "test1").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com", username: "test2").first_or_create(password: "password", password_confirmation: "password")

recipe1 = Recipe.create!(title: "Recipe 1", category: "default", dietary_restrictions: "default", rating: 0, description: "Default description", ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], instructions: ["Step 1", "Step 2", "Step 3"], image: "recipe1", user_id: user1.id)
recipe2 = Recipe.create!(title: "Recipe 2", category: "default", dietary_restrictions: "default", rating: 0, description: "Default description", ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"], instructions: ["Step 1", "Step 2", "Step 3"], image: "recipe2", user_id: user2.id)