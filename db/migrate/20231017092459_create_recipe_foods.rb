class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :foods, null:false, foreign_key: {to_table: :foods}
      t.references :recipe, null:false, foreign_key: {to_table: :recipes}
      t.timestamps
    end
  end
end
