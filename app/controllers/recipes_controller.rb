# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes

    @pagy, @records = pagy(@recipes)
  end

  # para F8. View Recipe Details
  def show
    @recipe = Recipe.find(params[:id])
  end

  # F5. Create Recipe
  def new
    @recipe = Recipe.new
  end

  # F5. Create Recipe
  def create
    # Llamo al servicio que genera la receta utilizando IA y
    # le paso los ingredientes del formulario
    @recipe = RecipeGeneratorService.new(recipe_params[:ingredients], current_user.id).call

    if @recipe.name == 'Error'
      redirect_to recipes_path, alert: t('.error_con_preferencias')
    elsif @recipe.save
      render :show, notice: t('.success') # Intenta guardar la receta
    else
      render :new, status: :unprocessable_entity
    end
  rescue RecipeGeneratorServiceError => e
    flash[:alert] = e.message
    redirect_back(fallback_location: recipes_path)
  end

  # R9 Delete Recipe
  def destroy
    @old_recipe = Recipe.find(params[:id])
    if @old_recipe.destroy!
      redirect_to recipes_path, notice: t('.success')
    else
      redirect_to recipes_path, alert: t('.error')
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :ingredients)
  end
end
