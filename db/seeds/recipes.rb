require 'json'

file_path = Rails.root.join('db', 'seeds', 'recipes-en.json')
users_data = JSON.parse(File.read(file_path))

users_data.each do |recipe|
  Recipe.create!(recipe)
end