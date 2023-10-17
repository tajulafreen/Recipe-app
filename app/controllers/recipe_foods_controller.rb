class RecipeFoodsController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_food = @recipe.recipe_foods.create(recipe_food_params)
        redirect_to recipe_path(@recipe)
      end
    
      private
    
      def recipe_food_params
        params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
      end
end
