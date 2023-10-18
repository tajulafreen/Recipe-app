class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:is_public_recipes]
  def public_recipes
    @public_recipes = Recipe.where(is_public: true).includes(recipe_foods: :food)
  end

  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(is_public: !@recipe.is_public)
      redirect_to @recipe, notice: 'Recipe public status was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'The recipes Was created succesfully'
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time_minutes, :cooking_time_minutes, :description, :is_public)
  end

  def calculate_total_price(recipe)
    total_price = 0.0

    recipe.recipe_foods.each do |recipe_food|
      total_price += recipe_food.food.price * recipe_food.quantity
    end

    total_price
  end
end
