class PagesController < ApplicationController

  def home
    @categories = Category.all
    @recipes = Recipe.all
  end
  
  def about
    @categories = Category.all
    @recipes = Recipe.all
  end

  def measure
    @categories = Category.all
    @recipes = Recipe.all
  end

end
