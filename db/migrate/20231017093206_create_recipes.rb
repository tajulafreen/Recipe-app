class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time_minutes
      t.integer :cooking_time_minutes
      t.string :description
      t.boolean :is_public
      t.references :user, null:false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
