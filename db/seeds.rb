# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients["drinks"].each do |ingredient|
  ingredient_name = ingredient['strIngredient1']
  instance_ingredient = Ingredient.new(name: ingredient_name)
  instance_ingredient.save
end

url_cocktail = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'
cocktails_serialized = open(url_cocktail).read
cocktails = JSON.parse(cocktails_serialized)

cocktails["drinks"].each do |cocktail|
  cocktail_name = cocktail['strDrink']
  instance_cocktail = Cocktail.new(name: cocktail_name)
  instance_cocktail.save
end

