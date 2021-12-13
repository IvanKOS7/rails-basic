class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.rename_column(:title, :category)

      t.timestamps
    end
  end
end
