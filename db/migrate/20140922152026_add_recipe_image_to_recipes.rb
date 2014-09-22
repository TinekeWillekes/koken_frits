class AddRecipeImageToRecipes < ActiveRecord::Migration
  def change
    add_attachment :recipes, :recipe_image
  end
end
