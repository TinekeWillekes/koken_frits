class RecipesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @recipes = current_user.recipes.all
  end
  
  def show
    @recipe = current_user.recipes.find(params[:id])
    @list_of_ingredients = @recipe.quantities.all
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash.now[:success] = "Added new recipe"
      redirect_to recipes_path
    else
      flash.now[:error] = "Error"
      render "new"
    end
  end
  
  def edit
    @recipe = current_user.recipes.find(params[:id])
  end
  
  def update
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash.now[:success] = "Recipe updated"
      redirect_to recipes_path
    else
      render 'edit'
    end
  end
  
  def destroy
    current_user.recipes.find(params[:id]).destroy
    flash[:success] = "Recipe deleted."
    redirect_to recipes_path
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:id, :_destroy, :title, :directions, :number_of_persons, :cooking_time, :recipe_image, :tip, :history,
                                    :quantities_attributes => [:id, :_destroy, :amount, :recipe_id, :ingredient_id,
                                    :ingredient_attributes => [:id,:_destroy, :name]])
  end
  
end
