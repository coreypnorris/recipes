class CreateRecipesTags < ActiveRecord::Migration
  def change
    create_table :recipes_tags do |t|
      t.references :tag
      t.references :recipe
    end
  end
end
