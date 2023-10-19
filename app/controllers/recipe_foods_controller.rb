class RecipeFoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe

  def new
    @recipe_food = RecipeFood.new
  end

  def show
    @recipe_food = RecipeFood.find(params[:id])
  end

  def create
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully removed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
