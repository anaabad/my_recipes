require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #add_ingredient" do
    it "adds a new ingredient to the session and redirects to search" do
      get :add_ingredient, params: { query: "flour" }

      expect(session[:ingredients]).to include("flour")
      expect(response).to redirect_to(:search_recipes)
    end
  end

  describe "GET #clean_ingredients" do
    it "clears the session ingredients and redirects to search" do
      session[:ingredients] = ["yeast", "salt"]

      get :clean_ingredients

      expect(session[:ingredients]).to be_nil
      expect(response).to redirect_to(:search_recipes)
    end
  end

  describe "GET #search" do
    before do
      Recipe.create!(
        title: "Rustic Bread",
        ingredients: %w[water flour salt yeast]
      )
      Recipe.create!(
        title: "Green Salad",
        ingredients: %w[lettuce tomato oil]
      )
    end
    it "adds query to session and finds matching recipes" do
      get :search, session: { ingredients: ["flour", "water", "salt", "yeast"] }

      expect(session[:ingredients]).to contain_exactly("flour", "water", "salt", "yeast")
      expect(assigns(:recipes).map(&:title)).to include("Rustic Bread")
      expect(assigns(:recipes).map(&:title)).not_to include("Green Salad")
    end

    it "assigns empty recipes array if no ingredients in session or params" do
      get :search

      expect(assigns(:recipes)).to eq([])
    end
  end
end
