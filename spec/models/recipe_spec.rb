require 'rails_helper'
require "testcontainers/postgres"

RSpec.describe Recipe, type: :model do
  describe "partial_match_recipe" do
    after(:all) do
      Recipe.delete_all
    end
    let!(:partial_match_recipe) do
      Recipe.create!(
        title: "Rustic Bread",
        ingredients: %w[flour water yeast salt]
      )
    end

    let!(:only_matching_ingredients) do
      Recipe.create!(
        title: "Salted Crackers",
        ingredients: %w[flour water salt]
      )
    end

    let!(:non_matching_recipe) do
      Recipe.create!(
        title: "Green Smoothie",
        ingredients: %w[spinach banana almondmilk]
      )
    end

    it "returns only recipes containing all substrings" do
      results = Recipe.only_matching_ingredients("flour", "salt", "water")

      expect(results).to include(only_matching_ingredients)
      expect(results).not_to include(partial_match_recipe)
      expect(results).not_to include(non_matching_recipe)
    end

    it "returns nothing if no recipes match all substrings" do
      results = Recipe.only_matching_ingredients("unicorn", "dust")

      expect(results).to be_empty
    end
  end
end
