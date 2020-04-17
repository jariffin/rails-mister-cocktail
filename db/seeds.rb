require 'open-uri'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database..."
Ingredient.destroy_all

puts "Creating Ingredients"


# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
result = open(url).read
ingredients = JSON.parse(result)["drinks"]

ingredients.each do |i|
  ingredient = Ingredient.create!(
    name: i["strIngredient1"]
      )
end


