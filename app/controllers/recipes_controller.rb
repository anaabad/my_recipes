class RecipesController < ApplicationController
  api :post, '/recipes/add_ingredient'
  description 'Add a new ingredient'
  param :query, String, desc: 'ingredient to be added to the search'
  def add_ingredient
    session[:ingredients] ||= []
    session[:ingredients] << params[:query]
    redirect_to :search_recipes
  end
  api :post, '/recipes/clean_ingredients'
  description 'Clean up all ingredients'
  def clean_ingredients
    session[:ingredients] = nil
    redirect_to :search_recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  api :GET, '/recipes/search'
  description 'Search for recipes by ingredients on session'
  def search
    if session[:ingredients]
      @recipes = Recipe.only_matching_ingredients(*session[:ingredients].uniq).select(:id, :title, :ratings)
    else
      @recipes = []
    end
  end
  private

  def search_params
    params.permit(:query)
  end
end
