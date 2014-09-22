class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.string :ingredient
      t.boolean :done
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end
