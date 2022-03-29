class AddIndexesAndUniqueValues < ActiveRecord::Migration[6.1]
  def up
    add_index :tests, %i[title level], unique: true
    add_column :categories, :title, :string
    add_index :categories, :title, unique: true
  end

  def down
    remove_index :categories, :title, unique: true
    remove_index :tests, %i[title level], unique: true
    remove_column :categories, :title, :string
  end
end
