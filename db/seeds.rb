# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
puts "Destroying all ingredients"
puts "Making new ones..."

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

ingredients = RestClient.get "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_repo = JSON.parse(ingredients)

ingredients_repo["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])

end

puts "...Done"


