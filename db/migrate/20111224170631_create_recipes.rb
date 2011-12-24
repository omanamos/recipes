class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, :null => false
      t.text :cooking_time
      t.text :directions
      t.text :description

      t.timestamps
    end
  end
end
