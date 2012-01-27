class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, :null => false
      t.string :title, :null => false
      t.string :cooking_time
      t.text :directions
      t.text :description

      t.timestamps
    end
  end
end
