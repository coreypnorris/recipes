class AddStarsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :stars, :integer
  end
end
