class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :category
      t.string :dietary_restrictions
      t.integer :rating
      t.integer :description
      t.string :ingredients, array: true, default: []
      t.string :instructions, array: true, default: []
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
