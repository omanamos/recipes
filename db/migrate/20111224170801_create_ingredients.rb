class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :recipe, :null => false
      t.string :item, :null => false
      t.string :amount, :null => false

      t.timestamps
    end
  end
end
