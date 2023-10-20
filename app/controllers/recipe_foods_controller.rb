class RecipeFoodsController < ApplicationController
  load_and_authorize_resource
  #  before_action :set_recipe

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully added.'
    else
      render :new
    end
  end

  def modify
    recipe_food = RecipeFood.find(params[:id])
    new_quantity = params[:recipe_food][:quantity]

    if recipe_food.update(quantity: new_quantity)
      flash[:success] = 'Quantity updated successfully'
    else
      flash[:error] = 'Failed to update quantity'
    end

    redirect_to recipe_food_path(recipe_food)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully removed.'
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
