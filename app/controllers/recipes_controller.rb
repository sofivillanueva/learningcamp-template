# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
