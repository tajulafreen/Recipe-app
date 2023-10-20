class FoodsController < ApplicationController
  def index
    @user = current_user
    @foods = @user.foods.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      flash[:success] = 'Food was successfully added.'
      redirect_to foods_path, notice: 'Food was successfully added.'
    else
      flash[:error] = 'Food does not exist in your food list, please add it to your food list.'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      flash[:notice] = 'Food was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete food.'
    end
    redirect_to foods_path, notice: 'Food was successfully deleted.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price, :user_id)
  end
end
