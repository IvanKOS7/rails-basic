class AddAuthorAttributeToTests < ActiveRecord::Migration[6.1]
  def change
      add_column :tests, :author, :string , default: 'Unknown'
  end
end
