class ChangeDescription < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :description, :string
  end
end
